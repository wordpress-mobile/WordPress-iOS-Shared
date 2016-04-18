import Foundation

/// A type that can represent either failure with an error or success with a result value.
public enum Result<Value, Error: ErrorType> {
    case success(Value)
    case failure(Error)

    /// Constructs a `Result` with an optional value and optional error, and
    /// falls back to a second error if both are `nil`.
    ///
    /// The initializer will try to construct a `success` with `value` first,
    /// then a `failure` with error, and if both are `nil`, it will construct a
    /// `failure` with `fallbackError`.
    ///
    /// This methods is mostly useful for some Cocoa callbacks that send an
    /// optional result and error, like the NSURLSession completion handlers. In
    /// that case, you'd convert that into a `Result` like this:
    ///
    ///     let task = session.dataTaskWithRequest(request) {
    ///         data, response, error in
    ///
    ///         let result = Result(
    ///             value: data,
    ///             error: error,
    ///             fallbackError: MyErrors.bothDataAndErrorAreNil)
    ///         // ...
    ///
    public init(value: Value?, error: Error?, fallbackError: Error) {
        if let value = value {
            self = .success(value)
        } else if let error = error {
            self = .failure(error)
        } else {
            self = .failure(fallbackError)
        }
    }

    /// Transform `success` values by calling `transform` on the value, or wraps a `failure` into a new `Result`
    public func map<T>(@noescape transform: Value -> T) -> Result<T, Error> {
        return flatMap({ .success(transform($0)) })
    }

    /// Returns the result of applying `transform` to a `success` value, or wraps a `failure` into a new `Result`
    public func flatMap<T>(@noescape transform: Value -> Result<T, Error>) -> Result<T, Error> {
        switch self {
        case .success(let value):
            return transform(value)
        case .failure(let error):
            return .failure(error)
        }
    }

    /// Returns the value for a `success` or `nil` for a `failure`
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure(_):
            return nil
        }
    }

    /// Returns the error for a `failure` or `nil` for a `success` 
    public var error: Error? {
        switch self {
        case .success(_):
            return nil
        case .failure(let error):
            return error
        }
    }
}
