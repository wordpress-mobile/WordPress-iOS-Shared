import Quick

@testable import WordPressShared

class WPAnalyticsMethodBehaviorExamplesConfiguration: QuickConfiguration {
    override class func configure(_ configuration: QCKConfiguration!) {
        sharedExamples("a WPAnalyticsTracker method") { context in
            guard let context else {
                XCTFail("Test case needs to provide a context")
                return
            }
            guard let invocation = context()?["invocation"] else {
                XCTFail("invocation not found in the provided context")
                return
            }
            guard let theInvocation = invocation as? WPAnalyticsMethodBehaviorInvocation else {
                XCTFail("invocation not found in the provided context")
                return
            }

            it("should not be called if tqracker isn't registered") {
                WPAnalyticsTestVerifyUnregistered(theInvocation)
            }

            it("should be called if tracker is registered") {
                WPAnalyticsTestVerifyRegistered(theInvocation)
            }

            it("should be called on multiple trackers if registered") {
                WPAnalyticsTestVerifyMultipleTrackers(theInvocation)
            }
        }
    }
}

class WPAnalyticsTests: QuickSpec {
    override func spec() {
        beforeEach {
            WPAnalytics.clearTrackers()
        }

        describe("beginSession") {
            itBehavesLike("a WPAnalyticsTracker method") {
                [
                    "invocation": { (tracker: WPAnalyticsTracker) -> Void in
                        tracker.beginSession!()
                    }
                ]
            }
        }

        describe("endSession") {
            itBehavesLike("a WPAnalyticsTracker method") {
                [
                    "invocation": { (tracker: WPAnalyticsTracker) -> Void in
                        tracker.endSession!()
                    }
                ]
            }
        }

        describe("refreshMetadata") {
            itBehavesLike("a WPAnalyticsTracker method") {
                [
                    "invocation": { (tracker: WPAnalyticsTracker) -> Void in
                        tracker.refreshMetadata!()
                    }
                ]
            }
        }

        describe("beginTimerForStat:") {
            itBehavesLike("a WPAnalyticsTracker method") {
                [
                    "invocation": { (tracker: WPAnalyticsTracker) -> Void in
                        tracker.beginTimer!(for: .applicationOpened)
                    }
                ]
            }
        }

        describe("endTimerForStat:withProperties") {
            itBehavesLike("a WPAnalyticsTracker method") {
                [
                    "invocation": { (tracker: WPAnalyticsTracker) -> Void in
                        tracker.endTimer!(for: .applicationOpened, withProperties: [:])
                    }
                ]
            }
        }

        describe("track:") {
            itBehavesLike("a WPAnalyticsTracker method") {
                [
                    "invocation": { (tracker: WPAnalyticsTracker) -> Void in
                        tracker.track(.applicationOpened)
                    }
                ]
            }
        }

        describe("track:withProperties:") {
            itBehavesLike("a WPAnalyticsTracker method") {
                [
                    "invocation": { (tracker: WPAnalyticsTracker) -> Void in
                        tracker.track(.applicationOpened, withProperties: [:])
                    }
                ]

            }
        }

        describe("trackString:") {
            itBehavesLike("a WPAnalyticsTracker method") {
                [
                    "invocation": { (tracker: WPAnalyticsTracker) -> Void in
                        tracker.trackString("my_event")
                    }
                ]
            }
        }

        describe("trackString:withProperties:") {
            itBehavesLike("a WPAnalyticsTracker method") {
                [
                    "invocation": { (tracker: WPAnalyticsTracker) -> Void in
                        tracker.trackString("my_event", withProperties: [:])
                    }
                ]
            }
        }
    }
}
