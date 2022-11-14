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
    /*
     To generate static documentation in a deleted ./docs directory enter with appropriate directory in terminal:
     
     cd ~/Documents/Apps/RemoteSwiftPackages/LockApp
     swift package --allow-writing-to-directory ./docs generate-documentation --target LockApp --disable-indexing --transform-for-static-hosting --hosting-base-path LockApp --output-path ./docs
     
     To preview documentation:
     1.) Enter in terminal while in the same directory as before:
     
     swift package --disable-sandbox preview-documentation --target LockApp
     
     2.) Enter url in browser:
     
     localhost:8000/documentation/lockapp
     
     3.) Terminate web server in terminal with control-c.
     */
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "LockApp",
            dependencies: []),
    ]
)
