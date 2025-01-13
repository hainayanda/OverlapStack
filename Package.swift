// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OverlapStack",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "OverlapStack",
            targets: ["OverlapStack"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "OverlapStack",
            dependencies: [],
            path: "OverlapStack/Classes"
        ),
       .testTarget(
           name: "OverlapStackTests",
           dependencies: [
               "OverlapStack"
           ],
           path: "Example/Tests",
           exclude: ["Info.plist"]
       )
    ]
)