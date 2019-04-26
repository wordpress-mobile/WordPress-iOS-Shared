import Foundation

extension DispatchTimeInterval {
    public func nanoSeconds() -> UInt64 {
        let convertToNanoseconds = { (value: Int, nanoSecondsPerUnit: UInt64) -> UInt64 in
            return UInt64(value) * nanoSecondsPerUnit
        }
        
        switch self {
        case .seconds(let value):
            return convertToNanoseconds(value, NSEC_PER_SEC)
        case .milliseconds(let value):
            return convertToNanoseconds(value, NSEC_PER_MSEC)
        case .microseconds(let value):
            return convertToNanoseconds(value, NSEC_PER_USEC)
        case .nanoseconds(let value):
            return UInt64(value)
        case .never:
            return UINT64_MAX
        }
    }
}

public class WPTimer {

    /// The timer's tick closure type.
    ///
    /// - Returns:
    ///     - `true` if the timer should stop
    ///     - `false` otherwise
    ///
    public typealias TickClosure = () -> (Bool)
    
    /// Convenience alias for abstraction purposes.
    ///
    public typealias Interval = DispatchTimeInterval
    
    // MARK: - Timer: user definition
    
    /// The block that will be executed on each tick.
    ///
    private let onTick: TickClosure
    
    /// The initial delay before the first tick of the clock.
    ///
    let delay: Interval
    
    /// The time interval between each tick.
    ///
    let interval: Interval
    
    /// Whether the timer will keep ticking after the first tick.
    ///
    let repeats: Bool
    
    /// The leeway allowed for firing the timer.
    ///
    let leeway: Interval
    
    // MARK: - Timer: low level
    
    /// The timer source for our active timer.  This is `nil` whenever the timer is NOT running.
    ///
    private var timerSource: DispatchSourceTimer?
    
    // MARK: - Multithreading support

    /// Specifies if the "tick" block should be executed on the main thread. Defaults to true since
    /// that's less likely to cause issues by default.
    ///
    let tickOnMainThread: Bool
    
    /// The GCD queue this timer will use for thread safety.
    ///
    private var timerQueue = DispatchQueue(label: "timerDispatchQueue")
    
    // MARK: - Initialization
    
    public required init(
        delay: Interval = Interval.seconds(0),
        every interval: Interval = Interval.seconds(0),
        leeway: Interval = Interval.seconds(50),
        repeats: Bool = false,
        tickOnMainThread: Bool = true,
        do onTick: @escaping TickClosure) {
        
        assert(delay != Interval.seconds(0) || interval != Interval.seconds(0))
        assert(interval != Interval.seconds(0) || repeats == false)
        
        self.delay = delay
        self.onTick = onTick
        self.interval = interval
        self.leeway = leeway
        self.repeats = repeats
        self.tickOnMainThread = tickOnMainThread
    }

    // MARK: - Starting & stopping the timer

    /// Starts the timer.
    ///
    /// - Note: The difference with `startTimer()` is that this method queues the operation for
    ///     thread-safety, and blocks `timerQueue`.  As such this method is intended for external
    ///     use.
    ///
    public func start() {
        timerQueue.sync { [weak self] () -> Void in
            self?.startImmediately()
        }
    }
    
    /// Starts the timer immediately.
    ///
    /// - Note: This method needs to be called from within the timer's queue.
    ///
    private func startImmediately() {
        if !isRunning() {
            self.startTicking()
        }
    }
    
    /// Stops the timer.
    ///
    /// - Note: The difference with `stopTimer()` is that this method queues the operation for
    ///     thread-safety, and blocks `timerQueue`.  As such this method is intended for external
    ///     use, or **very careful** internal use.
    ///
    public func stop() {
        timerQueue.sync { [weak self] () -> Void in
            self?.stopImmediately()
        }
    }
    
    /// Stops the timer immediately.
    ///
    /// - Note: This method needs to be called from within the timer's queue.
    ///
    private func stopImmediately() {
        if let timerSource = runningTimerSource() {
            timerSource.cancel()
            self.timerSource = nil
        }
    }
    
    // MARK: - Timer scheduling
    
    /// This is the code that will be executed each time the timer ticks.
    /// This method simply executes the specified block on the appropriate queue (either main queue
    /// or the timer's queue).
    ///
    private func tick() {
        if tickOnMainThread {
            DispatchQueue.main.async {
                let keepRunning = self.onTick()
                
                if !keepRunning {
                    self.stop()
                }
            }
        } else {
            let keepRunning = self.onTick()
            
            if !keepRunning {
                stopImmediately()
            }
        }
    }
    
    /// Start ticking the clock.  Schedules the first tick.
    ///
    private func startTicking() {
        let newTimerSource = DispatchSource.makeTimerSource(flags: .strict, queue: timerQueue)
        timerSource = newTimerSource
        
        newTimerSource.setEventHandler { [weak self] () -> Void in
            self?.tick()
        }
        
        let deadline = DispatchTime.now() + delay
        
        newTimerSource.schedule(
            deadline: deadline,
            repeating: interval,
            leeway: leeway)
        
        newTimerSource.resume()
    }
    
    /// Call this method to know if the timer is running.
    ///
    /// - Returns: `true` if the timer is running, `false` otherwise.
    ///
    public func isRunning() -> Bool {
        return runningTimerSource() != nil
    }
    
    // MARK: - Calculated values
    
    /// Whenever we need the currently-running `timerSource`, call this method.  This method
    /// evaluates if the `timerSource` exist, and if it's been cancelled.
    ///
    /// - Returns: the running `timerSource`, or `nil` if none is running.
    ///
    private func runningTimerSource() -> DispatchSourceTimer? {
        
        guard let timerSource = timerSource,
            !timerSource.isCancelled else {
                return nil
        }
        
        return timerSource
    }
    
    // MARK: - DispatchTimeInterval to DispatchTime conversion
    
    private static func dispatchTime(for timeInterval: DispatchTimeInterval) -> DispatchTime {
        let nanoseconds = timeInterval.nanoSeconds()
        
        guard nanoseconds > 0 else {
            return .now()
        }
        
        guard nanoseconds < UINT64_MAX else {
            return .distantFuture
        }
        
        return DispatchTime(uptimeNanoseconds: nanoseconds)
    }
}
