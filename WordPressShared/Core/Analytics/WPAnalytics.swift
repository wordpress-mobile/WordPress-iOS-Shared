import Foundation

extension WPAnalytics {

    /// Track a event
    ///
    /// This will call each registered tracker and fire the given event
    /// - Parameter track: a `String` that represents the event name
    ///
    public static func track(_ event: String) {
        WPAnalytics.trackEvent(event)
    }

}
