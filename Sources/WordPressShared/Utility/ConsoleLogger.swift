/// A `WordPressLoggingDelegate` implementation that logs to the Xcode console via `print`.
/// Useful for development or debugging. Not recommended in release builds.
public class ConsoleLogger: NSObject, WordPressLoggingDelegate {

    public func logError(_ str: String) {
        print("❌ – Error: \(str)")
    }

    public func logWarning(_ str: String) {
        print("⚠️ – Warning: \(str)")
    }

    public func logInfo(_ str: String) {
        print("ℹ️ – Info: \(str)")
    }

    public func logDebug(_ str: String) {
        print("🔎 – Debug: \(str)")
    }

    public func logVerbose(_ str: String) {
        print("📃 – Verbose: \(str)")
    }
}
