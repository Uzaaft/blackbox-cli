// swift-tools-version:6.2
import PackageDescription

let package = Package(
    name: "blackbox-cli",
    platforms: [.macOS(.v26)],
    products: [
        .executable(name: "blackbox", targets: ["BlackBoxCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.6.1"),
        .package(url: "https://github.com/jkrukowski/SQLiteVec", from: "0.0.9"),
    ],
    targets: [
        .executableTarget(
            name: "BlackBoxCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Sources/BlackBoxCLI"
        )
    ]
)
