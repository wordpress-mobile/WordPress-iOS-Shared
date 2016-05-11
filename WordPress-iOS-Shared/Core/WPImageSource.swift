import Foundation
import UIKit

/// WPImageSource is a wrapper around ImageDownloadPool, which adds authentication
/// and HTTPS enforcing for images on WordPress.com private blogs.
///
public class WPImageSource : NSObject {

    /// Returns the shared source object.
    ///
    public static let sharedSource = WPImageSource()

    /// Schedules a download for the given url, if there isn't one in progress.
    ///
    /// Assumes HTTPS should be used for the protocol if it's a WordPress.com
    /// site.
    ///
    /// Note that the success or failure block will be called whether the call
    /// initiated a network request or reused an existing one.
    ///
    /// - parameter url: The URL to download.
    /// - parameter success: The block to execute if the download was successful.
    /// - parameter failure: The block to execute if the download failed.
    ///
    public func downloadImageForURL(url: NSURL, withSuccess success: (UIImage -> Void)?, failure: (NSError -> Void)?) {
        let request = requestForURL(url)
        downloadImageWithRequest(request, withSuccess: success, failure: failure)
    }


    /// Schedules an authenticated download for the given URL, if there isn't one in progress.
    ///
    /// Assumes HTTPS should be used for the protocol if it's a WordPress.com
    /// site.
    ///
    /// Note that the success or failure block will be called whether the call
    /// initiated a network request or reused an existing one.
    ///
    /// - parameter url: The URL to download
    /// - parameter authToken: The authentication token (Bearer) to use (generally assumes this is used for WP.com)
    /// - parameter success: The block to execute if the download was successful
    /// - parameter failure: The block to execute if the download failed
    ///
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
