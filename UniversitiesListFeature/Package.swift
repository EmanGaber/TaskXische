// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UniversitiesListFeature",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UniversitiesListFeature",
            targets: ["UniversitiesListFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-cocoa", exact: "10.50.0")
        ,.package(path: "../Common")],
    
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "UniversitiesListFeature",
            
            dependencies: ["Common",
                           .product(name: "RealmSwift",package: "realm-cocoa")]
        ),
        
            .testTarget(
                name: "UniversitiesListFeatureTests",
                dependencies: ["UniversitiesListFeature"]),
        
        
    ]
)
