// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "blackbox-cli",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "blackbox-cli", targets: ["blackbox-cli"])
    ],
    targets: [
        .executableTarget(
            name: "blackbox-cli",
            dependencies: []
        )
    ]
)
