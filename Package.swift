// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InboxKit",
    platforms: [
         .iOS(.v13)
    ],
    products: [
        .library(
            name: "InboxKit",
            targets: ["InboxKit"]
        ),
    ],
    targets: [
        .target(
            name: "InboxKit",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "InboxKitTests",
            dependencies: ["InboxKit"]
        ),
    ]
)
