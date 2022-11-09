// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "WordPressShared",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "WordPressShared", targets: ["WordPressShared"])
    ],
    dependencies: [
        .package(url: "https://github.com/buildkite/test-collector-swift", from: "0.3.0"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack", from: "3.8.0"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs", from: "9.1.0"),
        // See https://github.com/erikdoe/ocmock/issues/500#issuecomment-1002700625
        .package(url: "https://github.com/erikdoe/ocmock", revision: "afd2c6924e8a36cb872bc475248b978f743c6050"),
        .package(url: "https://github.com/Quick/Quick", from: "6.0.0"),
    ],
    targets: [
        .target(
            name: "WordPressSharedAnalyticsObjC",
            path: "WordPressShared/Core/Analytics",
            sources: ["WPAnalytics.m"],
            publicHeadersPath: "."
        ),
        .target(
            name: "WordPressSharedAnalytics",
            dependencies: [.target(name: "WordPressSharedAnalyticsObjC")],
            path: "WordPressShared/Core/Analytics",
            sources: ["AnalyticsEvent.swift"]
        ),
        .target(
            name: "WordPressSharedLoggingObjCPrivate",
            dependencies: [.product(name: "CocoaLumberjack", package: "CocoaLumberjack")],
            path: "WordPressShared/Private",
            sources: ["WPSharedLoggingPrivate.m",],
            publicHeadersPath: "."
        ),
        .target(
            name: "WordPressSharedLoggingObjC",
            dependencies: [.target(name: "WordPressSharedLoggingObjCPrivate")],
            path: "WordPressShared/Core/Logging",
            sources: ["WPSharedLogging.m"],
            publicHeadersPath: "."
        ),
        .target(
            name: "WordPressSharedUtlityObjC",
            dependencies: [
                .target(name: "WordPressSharedLoggingObjCPrivate"),
                .target(name: "WordPressSharedResources"),
            ],
            path: "WordPressShared/Core/Utility",
            sources: [
                "PhotonImageURLHelper.m",
                "NSString+Helpers.m",
                "DisplayableImageHelper.m",
                "NSString+XMLExtensions.m",
                "WPFontManager.m",
                "DateUtils.m",
                "WPDeviceIdentification.m",
                "NSString+Util.m",
                "UIDevice+Helpers.m",
                "NSBundle+VersionNumberHelper.m",
                "WPImageSource.m",
                "WPMapFilterReduce.m",
            ],
            publicHeadersPath: "."
        ),
        .target(
            name: "WordPressSharedResources",
            dependencies: [.product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack")],
            path: "WordPressShared",
            sources: [
                "Core/Utility/NSBundle+WordPressShared.swift",
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "WordPressSharedUtlity",
            dependencies: [
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
                .target(name: "WordPressSharedUtlityObjC"),
                .target(name: "WordPressSharedResources"),
            ],
            path: "WordPressShared/Core/Utility",
            sources: [
                "String+StripGutenbergContentForExcerpt.swift",
                "EmailFormatValidator.swift",
                "String+RemovingMatches.swift",
                "EmailTypoChecker.swift",
                "Dictionary+Helpers.swift",
                "Secret.swift",
                "WPImageURLHelper.swift",
                "NSDate+Helpers.swift",
                "CollectionType+Helpers.swift",
                "NSString+Summary.swift",
                "String+StripShortcodes.swift",
                "RichContentFormatter.swift",
                "String+URLValidation.swift",
                "Debouncer.swift",
                "Languages.swift",
                "NSString+Swift.swift",
                "NSMutableData+Helpers.swift",
                "String+Helpers.swift",
            ]
        ),
        .target(
            name: "WordPressSharedViewObjC",
            dependencies: [
                .target(name: "WordPressSharedUtlityObjC")
            ],
            path: "WordPressShared/Core/Views",
            sources: [
                "WPStyleGuide.m",
                "WPTextFieldTableViewCell.m",
                "WPTableViewCell.m",
                "WPNUXUtility.m",
            ],
            publicHeadersPath: "."
        ),
        .target(
            name: "WordPressSharedView",
            dependencies: [
                .target(name: "WordPressSharedViewObjC"),
            ],
            path: "WordPressShared/Core/Views",
            sources: [
                "WPStyleGuide+SerifFonts.swift",
                "WPStyleGuide+DynamicType.swift",
            ]
        ),
        .target(
            name: "WordPressShared",
            dependencies: [
                .target(name: "WordPressSharedAnalyticsObjC"),
                .target(name: "WordPressSharedAnalytics"),
                .target(name: "WordPressSharedLoggingObjC"),
                .target(name: "WordPressSharedUtlityObjC"),
                .target(name: "WordPressSharedResources"),
                .target(name: "WordPressSharedUtlity"),
                .target(name: "WordPressSharedViewObjC"),
                .target(name: "WordPressSharedView"),
            ],
            path: "WordPressShared",
            sources: ["WordPressShared.swift"]
        ),
        .testTarget(
            name: "WordPressSharedTests",
            dependencies: [
                .target(name: "WordPressShared"),
                .product(name: "OCMock", package: "ocmock"),
                "Quick",
                "OHHTTPStubs",
            ],
            path: "WordPressSharedTests",
            sources: [
                "WPImageSourceTest.m",
                "TestAnalyticsTracker.m",
                "PhotonImageURLHelperTest.m",
                "DisplayableImageHelperTest.m",
                "NSStringHelpersTests.m",
                "WPAnalyticsTests.m",
                "NSStringSwiftTests.m",
                "WPMapFilterReduceTest.m",
            ],
            resources: [
                .copy("anim-reader.gif"),
                .copy("test-image.jpg"),
            ]
        )
    ]
)
