import Foundation

public extension NSURL {
    /// Returns the same URL replacing the HTTP scheme with HTTPS.
    public var enforcingHTTPS: NSURL {
        guard scheme == "http",
            let components = NSURLComponents(URL: self, resolvingAgainstBaseURL: false) else {
                return self
        }

        components.scheme = "https"

        return components.URL ?? self
    }

    /// Returns a URL with HTTP changed to HTTPS if the host matches the domain.
    public func enforcingHTTPSForDomain(domain: String) -> NSURL {
        if let host = host where host.hasSuffix(domain) {
            return enforcingHTTPS
        } else {
            return self
        }
    }
}
