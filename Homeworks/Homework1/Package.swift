// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Homework1",
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Homework1"),
        .testTarget(
            name: "Homework1Tests",
            dependencies: ["Homework1"]),

        .target(
            name: "Homework1Answer"),
        .testTarget(
            name: "Homework1AnswerTests",
            dependencies: ["Homework1Answer"]),


    ]
)
