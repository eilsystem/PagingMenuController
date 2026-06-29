// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PagingMenuController",
    platforms: [
        .iOS("17.7")
    ],
    products: [
        .library(
            name: "PagingMenuController",
            targets: ["PagingMenuController"]
        )
    ],
    targets: [
        .target(
            name: "PagingMenuController"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
