import Foundation

#if !SWIFT_PACKAGE
private class BundleFinder: NSObject {}
#endif

extension Bundle {

    /// Returns the WordPressShared Bundle
    /// If installed via CocoaPods, this will be WordPressShared.bundle,
    /// otherwise it will be the framework bundle.
    ///
    @objc public class var wordPressSharedBundle: Bundle {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        let defaultBundle = Bundle(for: BundleFinder.self)
        // If installed with CocoaPods, resources will be in WordPressShared.bundle
        if let bundleURL = defaultBundle.resourceURL,
            let resourceBundle = Bundle(url: bundleURL.appendingPathComponent("WordPressShared.bundle")) {
            return resourceBundle
        }
        // Otherwise, the default bundle is used for resources
        return defaultBundle
#endif
    }
}
