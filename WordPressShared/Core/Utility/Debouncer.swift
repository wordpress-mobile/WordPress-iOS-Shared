import Foundation

//From : https://github.com/webadnan/swift-debouncer

/// This class de-bounces the execution of a provided callback.
/// It also offers a mechanism to immediately trigger the scheduled call if necessary.
///
public final class Debouncer {
    private let callback: (() -> Void)
    private let delay: Double
    private var timer: WPTimer

    // MARK: - Init & deinit

    public init(delay: Double, callback: @escaping (() -> Void)) {
        
        // We could pass seconds to the timer, but since the Debouncer users doubles for the delay
        // we definitely want higher precision than seconds.
        //
        let millisecondsDelay = Int(delay * 1000)
        
        self.timer = WPTimer(delay: WPTimer.Interval.milliseconds(millisecondsDelay)) { () -> (Bool) in
            callback()
            return false
        }
        
        self.delay = delay
        self.callback = callback
    }

    deinit {
        if timer.isRunning() {
            timer.stop()
            callback()
        }
    }

    // MARK: - Debounce Request
    
    public func cancel() {
        timer.stop()
    }

    public func call(immediate: Bool = false) {
        timer.stop()

        if immediate {
            immediateCallback()
        } else {
            scheduleCallback()
        }
    }

    // MARK: - Callback interaction

    private func immediateCallback() {
        callback()
    }

    private func scheduleCallback() {
        timer.start()
    }
}
