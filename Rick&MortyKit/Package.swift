// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rick&MortyKit",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Rick&MortyKit",
            targets: ["Rick&MortyKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/theleftbit/BSWFoundation.git", from: "6.0.0"),
    ],
    targets: [
        .target(
            name: "Rick&MortyKit",
            dependencies: [
                "BSWFoundation",
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "Rick&MortyKitTests",
            dependencies: ["Rick&MortyKit"]),
    ]
)
