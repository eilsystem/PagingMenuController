// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PagingMenuController",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "PagingMenuController",
            targets: ["PagingMenuController"]
        )
    ],
    targets: [
        .target(
            name: "PagingMenuController",
            path: "Pod/Classes"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)