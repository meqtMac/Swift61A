// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Homework2",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Homework2"),
        .testTarget(
            name: "Homework2Tests",
            dependencies: ["Homework2"]
        ),

        .target(
            name: "Homework2Answer"),
        .testTarget(
            name: "Homework2AnswerTests",
            dependencies: ["Homework2Answer"]
        ),
    ]
)
