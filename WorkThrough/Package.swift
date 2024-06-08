// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Lab00",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-system", from: "1.0.0"),
        // other dependencies
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Lab00",
            dependencies: [
                .product(name: "SystemPackage", package: "swift-system"),
            ]
            // resources: [
            //     .copy("../../Resources/Lab00/")
            // ]
        ),
    ]
)

