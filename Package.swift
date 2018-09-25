// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "KeyPathKit",
    products: [
        .library(
            name: "KeyPathKit",
            targets: ["KeyPathKit"]),
    ],
    targets: [
        .target(
            name: "KeyPathKit",
            dependencies: [],
            path: "Sources")
    ]
)
