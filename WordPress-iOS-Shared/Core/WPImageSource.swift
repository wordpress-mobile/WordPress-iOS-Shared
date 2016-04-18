import Foundation
import UIKit

/**
 WPImageSource Error Codes
 */
public enum WPImageSourceError : UInt {

    case Unknown
    case NilImage
}

public let WPImageSourceErrorDomain: String = "WPImageSourceErrorDomain"

/**
 WPImageSource takes care of downloading images.

 It's a simple wrapper over AFImageRequestOperation that prevents duplicate requests. When a image URL is requested, it checks if there is a download in progress for that same URL.
 In that case, it doesn't start a new download but adds the sender to the list of objects to notify.

 Otherwise, a download is started.
 */
public class WPImageSource : NSObject {

    /**
     Returns the shared source object.

     @return the shared source object.
     */
    public static let sharedSource = WPImageSource()

    /**
     Schedules a download for the given url, if there isn't one in progress.

     Note that the success or failure block will be called whether the call initiated a network request or reused an existing one.

     @param url the URL to download.
     @param success the block to execute if the download was successful.
     @param failure the block to execute if the download failed.
     */
    public func downloadImageForURL(url: NSURL, withSuccess success: (UIImage -> Void)?, failure: (NSError -> Void)?) {
        downloadImageForURL(url, authToken: nil, withSuccess: success, failure: failure)
    }


    /**
     Schedules an authenticated download for the given URL, if there isn't one in progress.

     Assumes HTTPS should be used for the protocol.

     @param url the URL to download
     @param authToken the authentication token (Bearer) to use (generally assumes this is used for WP.com)
     @param success the block to execute if the download was successful
     @param failure the block to execute if the download failed
     */
    public func downloadImageForURL(url: NSURL, authToken: String?, withSuccess success: (UIImage -> Void)?, failure: (NSError -> Void)?) {
        let request = requestWithURL(url, authToken: authToken)
        pool.request(request) { result in
            switch result {
            case .success(let image):
                success?(image)
            case .failure(let error):
                failure?(error)
            }
        }
    }

    override init() {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: configuration)
        pool = ImageDownloadPool(session: session)
        super.init()
    }

    deinit {
        session.invalidateAndCancel()
    }

    // @koke - 2016-04-18
    // Copied this code from the Objective-C implementation
    // This needs to be extracted into NSURL helpers, as we're duplicating this 
    // logic in other places.
    // For now, let's focus the refactor on using OperationPools
    private func requestWithURL(url: NSURL, authToken: String?) -> NSURLRequest {
        var url = url
        var requestToken: String?
        if let token = authToken,
            let host = url.host
            where host.hasSuffix("wordpress.com") {
            requestToken = token
            if !url.absoluteString.hasPrefix("https") {
                url = NSURL(string: url.absoluteString.stringByReplacingOccurrencesOfString("http://", withString: "https://"))!
            }
        }

        let request = NSMutableURLRequest(URL: url, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 60)
        if let token = requestToken {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        return request
    }

    private let pool: ImageDownloadPool
    private let session: NSURLSession
}
