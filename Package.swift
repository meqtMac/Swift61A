// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Homework",
    // products: [
    //     // Products define the executables and libraries a package produces, making them visible to other packages.
    //     .library(
    //         name: "Homework01",
    //         targets: ["Homework01"]),
    // ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Homework01"),
        .testTarget(
            name: "Homework01Tests",
            dependencies: ["Homework01"]),

        .target(
            name: "Homework01Answer"),
        .testTarget(
            name: "Homework01AnswerTests",
            dependencies: ["Homework01Answer"]),


    ]
)
