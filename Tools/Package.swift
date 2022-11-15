// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Tools",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "RegexChecker",
            targets: ["RegexChecker"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", exact: "0.50700.1"),
    ],
    targets: [
        .executableTarget(
            name: "RegexChecker",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxParser", package: "swift-syntax"),
            ]
        )
    ]
)
