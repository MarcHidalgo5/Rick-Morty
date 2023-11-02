// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rick&MortyUI",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Rick&MortyUI",
            targets: ["Rick&MortyUI"]),
    ],
    dependencies: [
        .package(path: "Rick&MortyKit"),
        .package(url: "https://github.com/theleftbit/BSWFoundation.git", from: "6.0.0"),
        .package(url: "https://github.com/theleftbit/BSWInterfaceKit.git", from: "8.1.0"),
    ],
    targets: [
        .target(
            name: "Rick&MortyUI",
            dependencies: ["BSWFoundation", "BSWInterfaceKit", "Rick&MortyKit"]
        )
    ]
)
