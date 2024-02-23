// swift-tools-version:5.5

import Foundation
import PackageDescription

let package = Package(
    name: "WordPressShared",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "WordPressShared", targets: ["WordPressShared"])
    ],
    dependencies: [
        .package(url: "https://github.com/buildkite/test-collector-swift", from: "0.3.0"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs", from: "9.1.0"),
        // See https://github.com/erikdoe/ocmock/issues/500#issuecomment-1002700625
        .package(url: "https://github.com/erikdoe/ocmock", revision: "afd2c6924e8a36cb872bc475248b978f743c6050"),
        .package(url: "https://github.com/Quick/Quick", from: "6.0.0"),
        .package(url: "https://github.com/realm/SwiftLint", .exactItem(loadSwiftLintVersion()))
    ],
    targets: [
        .target(
            name: "WordPressSharedObjC",
            resources: [.process("Resources")]
        ),
        .target(
            name: "WordPressShared",
            dependencies: [
                .target(name: "WordPressSharedObjC"),
            ],
            resources: [.process("Resources")],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .testTarget(
            name: "WordPressSharedTests",
            dependencies: [
                .target(name: "WordPressShared"),
                .product(name: "OCMock", package: "ocmock"),
                .product(name: "BuildkiteTestCollector", package: "test-collector-swift"),
                "Quick",
                "OHHTTPStubs",
            ],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .testTarget(
            name: "WordPressSharedObjCTests",
            dependencies: [
                .target(name: "WordPressShared"),
                .product(name: "OCMock", package: "ocmock"),
                .product(name: "BuildkiteTestCollector", package: "test-collector-swift"),
                "Quick",
                "OHHTTPStubs",
            ],
            resources: [.process("Resources")],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
    ]
)

func loadSwiftLintVersion() -> Version {
    guard let yamlString = try? String(contentsOf: URL(fileURLWithPath: #file)
                                        .deletingLastPathComponent()
                                        .appendingPathComponent(".swiftlint.yml")) else {
        fatalError("Failed to read YAML file.")
    }

    guard let versionLine = yamlString.components(separatedBy: .newlines)
            .first(where: { $0.contains("swiftlint_version") }) else {
        fatalError("SwiftLint version not found in YAML file.")
    }

    // assumes the format `swiftlint_version: <version>`
    guard let version = Version(versionLine.components(separatedBy: ":")
                                    .last?
                                    .trimmingCharacters(in: .whitespaces) ?? "") else {
        fatalError("Failed to extract SwiftLint version.")
    }

    return version
}
