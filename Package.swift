// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PloegKit",
    platforms: [.macOS(.v13)],
    products: [.library(name: "PloegKit", targets: ["PloegKit"])],
    targets: [.target(name: "PloegKit", resources: [.process("Resources")])]
)
