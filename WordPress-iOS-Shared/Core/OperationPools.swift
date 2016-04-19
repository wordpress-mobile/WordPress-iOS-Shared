import UIKit

/// OperationPool is an abstraction to coalesce deterministic operations.
///
/// When you have an _expensive_ operation like a network request or resizing a
/// large image, it is common to resort to caching. But caching only avoids
/// extra operations once the first one has finished.
///
/// OperationPool takes care of coalescing multiple transformations for the same
/// resource, executing only once, and notifying of completion to all the
/// requesters.
///
/// Each operation transforms a `Key` into a `Value`. This could be a URL to a
/// data object, an image to a smaller image, or anything else. In any case, the
/// same `Key` should always produce the same `Value`.
///
/// Defining custom operation pools
/// -------------------------------
///
/// To define your own custom operations you can subclass OperationPool. All of
/// the defined methods are `final` so you are not supposed to override
/// anything.
///
/// Instead, define your own convenience initializer and call `init(_:)` with
/// your custom `start` function.
///
/// An alternative is to use a factory function instead:
///
///     func RequestPool(session: NSURLSession) -> OperationPool<NSURLRequest, NSData, NSError> {
///         return OperationPool { request, completion in
///             let task = session.dataTaskWithRequest(request) {
///                 data, response, error in
///     
///                 let result = Result(
///                     value: data,
///                     error: error,
///                     fallbackError: NetworkError.noDataAndNoError.nserror
///                 )
///                 completion(result)
///             }
///             task.resume()
///         }
///     }
/// 
/// Subclassing operation pools is only meant as a sort of typealias plus a
/// constuctor. If you need something more complicated, the recommendation is to
/// create a different type that just holds an instance of an operation pool.
///
/// Threading considerations
/// ------------------------
///
/// OperationPool is thread safe and can be called from any thread. Optionally,
/// it can be initialized with a queue in which the completion blocks will be
/// called. By default it uses a global low priority concurrent queue.
///
/// When an operation finishes, all the completion blocks are queued
/// asynchronously at the same time.
///
/// Note that there's a delay between the time the `start` function calls its
/// `completion` function and the completion blocks are called. If you want to
/// add some caching of results, the recommended way is to handle storing the
/// cached values from the `start` function to avoid duplicate operations.
///
/// When a new `request` causes an operation to start, your `start` function
/// will be called synchronously. It is your responsibility to ensure that your
/// `start` function doesn't block the caller thread.
///
public class OperationPool<Key: Hashable, Value, Error: ErrorType> {
    public typealias Completion = Result<Value, Error> -> Void

    /// Initializes an OperationPool with the passed operation starter.
    ///
    /// This is where you define what a custom operation does. The `start`
    /// function will be called whenever there's a new `request` that's not
    /// already in progress. When the result is available, this function needs
    /// to call the passed `completion` function.
    ///
    /// Optionally you can pass a custom queue where the completion blocks
    /// should be called. By default it uses a global concurrent queue.
    ///
    public init(completionQueue: dispatch_queue_t = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), start: (Key, completion: Completion) -> Void) {
        self.completionQueue = completionQueue
        self.start = start
    }

    /// Adds a new request for `key` and registers a `completion` block.
    ///
    /// If there isn't already a running operation for `key`, it will start one
    /// by calling the `start` method with `key`.
    /// It also keeps a reference to the completion block so it's called when
    /// the operation finishes.
    ///
    public final func request(key: Key, completion: Completion) {
        let count = addReturningCount(key, completion: completion)
        if count == 1 {
            startOperation(key)
        }
    }

    /// Starts the operation by calling the `start` function, then passes the
    /// result to `operationCompleted`.
    ///
    private func startOperation(key: Key) {
        start(key) { [weak self] result in
            self?.operationCompleted(key, result: result)
        }
    }

    /// Processes the result of a completed operation.
    ///
    /// This method will call all the registered completion functions with the
    /// result and remove them from the completions array.
    ///
    private func operationCompleted(key: Key, result: Result<Value, Error>) {
        let completions = fetchAndReset(key)
        completions.forEach({ completion in
            dispatch_async(completionQueue) {
                completion(result)
            }
        })
    }

    /// Adds a new completion function for the given key, and returns the number
    /// of completion blocks for that key, atomically.
    ///
    private func addReturningCount(key: Key, completion: Completion) -> Int {
        var count: Int = 0
        dispatch_sync(syncQueue) { [unowned self] in
            if var existingCompletions = self.completions[key] {
                existingCompletions.append(completion)
                self.completions[key] = existingCompletions
                count = existingCompletions.count
            } else {
                self.completions[key] = [completion]
                count = 1
            }
        }
        return count
    }

    /// Returns all the associated completion functions for the given key, and
    /// then removes them from the completions array, atomically.
    ///
    private func fetchAndReset(key: Key) -> [Completion] {
        var result = [Completion]()
        dispatch_sync(syncQueue) { [unowned self] in
            result = self.completions[key] ?? []
            self.completions[key] = []
        }
        return result
    }

    private final let start: (Key, completion: Completion) -> Void
    private final let completionQueue: dispatch_queue_t
    private final var completions = [Key: [Completion]]()

    private final let syncQueue = dispatch_queue_create("org.wordpress.shared.OperationPool", DISPATCH_QUEUE_SERIAL)
}

/// An OperationPool that turns a NSURLRequest into a NSData object using
/// `NSURSession.dataTaskWithRequest`.
public class NetworkRequestPool: OperationPool<NSURLRequest, NSData, NSError> {

    /// Constructs a new NetworkRequestPool.
    ///
    /// Optionally, you can specify the NSURLSession to use. By default, it uses
    /// the shared session.
    ///
    /// - parameter session: The NSURLSession to use for the network request. By
    /// default it uses `NSURLSession.sharedSession()`.
    ///
    public init(session: NSURLSession = NSURLSession.sharedSession()) {
        super.init { request, completion in
            let task = session.dataTaskWithRequest(request) { data, response, error in
                let result = Result(value: data, error: error, fallbackError: OperationPoolError.noDataAndNoError.nserror)
                completion(result)
            }
            task.resume()
        }
    }
}

/// An OperationPool that transforms a NSURLRequest into a Value.
///
/// It uses `NSURLSession.downloadTaskWithRequest` to download the file for the
/// given request, then uses a `Parser` to convert the downloaded file into the
/// wanted `Value`.
///
public class NetworkDownloadPool<Value>: OperationPool<NSURLRequest, Value, NSError> {
    public typealias Parser = NSURL -> Result<Value, NSError>

    /// Constructs a new NetworkDownloadPool with the given parser.
    ///
    /// Optionally, you can specify the NSURLSession to use. By default, it uses
    /// the shared session.
    ///
    /// - parameter parser: A function to be called to convert the downloaded
    /// file to a `Value`. The `parser` function takes a file `NSURL` that
    /// points to the location of the downloaded file, and returns a `Result`
    /// with the processed `Value`, or a `NSError`.
    ///
    /// - parameter session: The NSURLSession to use for the network request. By
    /// default it uses `NSURLSession.sharedSession()`.
    ///
    public init(parser: Parser, session: NSURLSession = NSURLSession.sharedSession()) {
        super.init { request, completion in
            let task = session.downloadTaskWithRequest(request) {
                location, response, error in

                let imageLocation = Result(value: location, error: error, fallbackError: OperationPoolError.noDataAndNoError.nserror)
                let image = imageLocation.flatMap(parser)
                completion(image)
            }
            task.resume()
        }
    }
}

/// An OperationPool to download images.
///
/// Builds on NetworkDownloadPool and transforms a `NSURLRequest` into a
/// `UIImage`.
///
/// If the downloaded data can't be turned into an image, it results in a
/// `OperationPoolError.invalidImageData` error.
///
public class ImageDownloadPool: NetworkDownloadPool<UIImage> {

    /// Constructs a new ImageDownloadPool.
    ///
    /// Optionally, you can specify the NSURLSession to use. By default, it uses
    /// the shared session.
    ///
    /// - parameter session: The NSURLSession to use for the network request. By
    /// default it uses `NSURLSession.sharedSession()`.
    ///
    public init(session: NSURLSession = NSURLSession.sharedSession()) {
        let parser: Parser = { url in
            do {
                let data = try NSData(contentsOfURL: url, options: .DataReadingUncached)
                if let image = UIImage(data: data) {
                    return .success(image)
                } else {
                    return .failure(OperationPoolError.invalidImageData.nserror)
                }
            } catch {
                return .failure(error as NSError)
            }
        }
        super.init(parser: parser, session: session)
    }
}

/// Errors related to OperationPool.
/// 
public enum OperationPoolError: Int {
    /// The NSURLSession completion block was called and both `data` and `error`
    /// are `nil`. It doesn't seem like something that _should_ not happen, but
    /// it's not enforced by the compiler and the documentation doesn't confirm
    /// that it won't happen.
    ///
    case noDataAndNoError

    /// The data we received was not a valid image, or at least not something
    /// that UIImage(data:) could process.
    ///
    case invalidImageData

    /// A description of the error, in English.
    ///
    /// - important: This description is for debugging purposes only and should
    /// not be shown to the user.
    ///
    public var description: String {
        // Untranslated as these error shouldn't be shown to users
        switch self {
        case .noDataAndNoError:
            return "Network response had no data and no error"
        case .invalidImageData:
            return "Couldn't generate a valid image with the returned data"
        }
    }

    /// The error converted to a NSError.
    ///
    public var nserror: NSError {
        return NSError(domain: "org.wordpress.shared.operationpool", code: rawValue, userInfo: [NSLocalizedDescriptionKey: description])
    }
}

