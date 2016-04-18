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
        let request = requestForURL(url)
        downloadImageWithRequest(request, withSuccess: success, failure: failure)
    }


    /**
     Schedules an authenticated download for the given URL, if there isn't one in progress.

     Assumes HTTPS should be used for the protocol.

     @param url the URL to download
     @param authToken the authentication token (Bearer) to use (generally assumes this is used for WP.com)
     @param success the block to execute if the download was successful
     @param failure the block to execute if the download failed
     */
    public func downloadImageForURL(url: NSURL, authToken: String, withSuccess success: (UIImage -> Void)?, failure: (NSError -> Void)?) {
        let request = authenticatedRequest(requestForURL(url), withAuthToken: authToken)
        downloadImageWithRequest(request, withSuccess: success, failure: failure)
    }

    private func downloadImageWithRequest(request: NSURLRequest, withSuccess success: (UIImage -> Void)?, failure: (NSError -> Void)?) {
        pool.request(request) { result in
            switch result {
            case .success(let value):
                success?(value)
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

    private func requestForURL(url: NSURL) -> NSURLRequest {
        return NSURLRequest(URL: url, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 60)
    }

    private func authenticatedRequest(request: NSURLRequest, withAuthToken token: String) -> NSURLRequest {
        let securedUrl = request.URL.map({ $0.enforcingHTTPSForDomain("wordpress.com") })

        guard let url = securedUrl,
            let host = url.host
            where host.hasSuffix("wordpress.com") else {
                return request
        }

        let request = request.mutableCopy() as! NSMutableURLRequest
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request.copy() as! NSURLRequest
    }

    private let pool: ImageDownloadPool
    private let session: NSURLSession
}
