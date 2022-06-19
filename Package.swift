// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LockApp",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15), .macOS(.v12), //.watchOS(.v8)
    ],
    products: [
        .library(
            name: "LockApp",
            targets: ["LockApp"]),
    ],
    dependencies: [
        //.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "LockApp",
            dependencies: []),
    ]
)
