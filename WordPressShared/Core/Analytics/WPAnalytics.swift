import Foundation

extension WPAnalytics {

    /// Track a event
    ///
    /// This will call each registered tracker and fire the given event
    /// - Parameter event: a `String` that represents the event name
    ///
    public static func track(_ event: String) {
        WPAnalytics.trackEvent(event)
    }

    /// Track a event
    ///
    /// This will call each registered tracker and fire the given event
    /// - Parameter event: a `String` that represents the event name
    /// - Parameter properties: a `Hash` that represents the properties
    ///
    public static func track(_ event: String, properties: [AnyHashable: Any]) {
        WPAnalytics.trackEvent(event, withProperties: properties)
    }

}
