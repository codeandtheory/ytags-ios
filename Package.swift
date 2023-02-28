// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YTags",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "YTags",
            targets: ["YTags"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/yml-org/YCoreUI.git",
            from: "1.4.0"
        ),
        .package(
            url: "https://github.com/yml-org/YMatterType.git",
            from: "1.4.0"
        )
    ],
    targets: [
        .target(
            name: "YTags",
            dependencies: ["YCoreUI", "YMatterType"]
        ),
        .testTarget(
            name: "YTagsTests",
            dependencies: ["YTags"]
        )
    ]
)
