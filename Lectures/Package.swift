// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let platforms: [Platform] = [
    .linux,
    .macOS
]

let package = Package(
    name: "Lecture",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Lecture",
            targets: ["Lecture"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-system", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Lecture",
            dependencies: [
                .product(name: "SystemPackage", package: "swift-system"),
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .target(
            name: "Lecture1",
            dependencies: [
                .product(name: "SystemPackage", package: "swift-system"),
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .executableTarget(
            name: "Lecture2",
            dependencies: [
                .product(name: "SystemPackage", package: "swift-system"),
                .product(name: "Logging", package: "swift-log"),
                "Lecture"
            ]
        ),
        .executableTarget(
            name: "Lecture3",
            dependencies: [
                //                .product(name: "SystemPackage", package: "swift-system"),
                //                .product(name: "Logging", package: "swift-log"),
                "Lecture"
            ]
        ),
        .executableTarget(
            name: "Lecture4",
            dependencies: [
                "Lecture"
            ]
        ),
        .executableTarget(
            name: "Lecture5",
            dependencies: [
                "Lecture"
            ]
        ),
        // Functional Abstraction
        .executableTarget(
            name: "Lecture6",
            dependencies: [
                "Lecture"
            ]
        ),
        
        // Recursion
        .executableTarget(
            name: "Lecture7",
            dependencies: [
                "Lecture"
            ]
        ),
        
        // Tree Recursion
        .target(
            name: "Lecture8"
        ),
        .executableTarget(
            name: "Lecture8Demo",
            dependencies: [
                "Lecture8"
            ]
        ),
        // Sequence
        .target(
            name: "Lecture9"
        ),
        .executableTarget(
            name: "Lecture9Demo",
            dependencies: [
                "Lecture9"
            ]
        ),
        // Container
        .target(
            name: "Lecture10"
        ),
        .executableTarget(
            name: "Lecture10Demo",
            dependencies: [
                "Lecture10"
            ]
        ),
        // Data Abstraction
        .target(
            name: "Lecture11"
        ),
        .executableTarget(
            name: "Lecture11Demo",
            dependencies: [
                "Lecture11"
            ]
        ),
        // Tree
        .executableTarget(
            name: "Lecture12Demo"
        ),
        // Mutablility
        .executableTarget(
            name: "Lecture13Demo"
        ),
         // Iterators
        .executableTarget(
            name: "Lecture14Demo"
        ),
        // Objects
         .executableTarget(
            name: "Lecture15Demo"
        ),
        // Attributes
         .executableTarget(
            name: "Lecture17Demo"
        ),
        // Representation
         .executableTarget(
            name: "Lecture18Demo"
        ),
         // Efficiency
         .target(
            name: "Lecture19"
        ),
        //
        .testTarget(
            name: "Lecture1Tests",
            dependencies: ["Lecture1"]),
    ]
)
