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
    dependencies: [
        .package(
            url: "https://github.com/ControlKit/ControlKitBase.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "InboxKit",
            dependencies: ["ControlKitBase"],
            resources: [
                .process("Resources"),
                .process("Data")
            ]
        ),
        .testTarget(
            name: "InboxKitTests",
            dependencies: ["InboxKit"]
        ),
    ]
)
