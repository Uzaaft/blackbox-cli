// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MyCLI",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "MyCLI", targets: ["MyCLI"])
    ],
    targets: [
        .executableTarget(
            name: "MyCLI",
            dependencies: []
        )
    ]
)
