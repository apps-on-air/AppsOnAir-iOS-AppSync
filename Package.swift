// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppsOnAir-AppSync",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "AppsOnAir-AppSync",
            targets: ["AppsOnAir-AppSync", "AppsOnAir-AppSync-ObjC"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/apps-on-air/AppsOnAir-iOS-Core.git",
            exact: "1.2.0"
        )
    ],
    targets: [
        .target(
            name: "AppsOnAir-AppSync",
            dependencies: [
                .product(name: "AppsOnAir-Core", package: "AppsOnAir-iOS-Core")
            ],
            path: "AppsOnAir-AppSync",
            sources: ["Classes"],
            resources: [
                .process("Assets")
            ]
        ),
        .target(
            name: "AppsOnAir-AppSync-ObjC",
            dependencies: ["AppsOnAir-AppSync"],
            path: "AppsOnAir_AppSync_ObjC",
            publicHeadersPath: "include"
        ),
    ]
)
