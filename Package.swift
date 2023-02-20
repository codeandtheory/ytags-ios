// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YTags",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "YTags",
            targets: ["YTags"]),
    ],
    targets: [
        .target(
            name: "YTags",
            dependencies: []),
        .testTarget(
            name: "YTagsTests",
            dependencies: ["YTags"]),
    ]
)
