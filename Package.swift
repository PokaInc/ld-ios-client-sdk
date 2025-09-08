// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "LaunchDarkly",
    platforms: [
        .iOS(.v17),
        .macOS(.v15),
        .watchOS(.v10),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "LaunchDarkly",
            targets: ["LaunchDarkly"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", exact: "9.1.0"),
        .package(url: "https://github.com/Quick/Quick.git", exact: "4.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", exact: "9.2.1"),
        .package(url: "https://github.com/mattgallagher/CwlPreconditionTesting", exact: "2.1.2"),
        .package(url: "https://github.com/LaunchDarkly/swift-eventsource", exact: "3.3.0"),
        .package(url: "https://github.com/mw99/DataCompression", exact: "3.8.0")
    ],
    targets: [
        .target(
            name: "LaunchDarkly",
            dependencies: [
                .product(name: "LDSwiftEventSource", package: "swift-eventsource"),
                .product(name: "DataCompression", package: "DataCompression")
            ],
            path: "LaunchDarkly/LaunchDarkly",
            exclude: ["Support"],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]),
        .testTarget(
            name: "LaunchDarklyTests",
            dependencies: [
                "LaunchDarkly",
                .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs"),
                .product(name: "Quick", package: "Quick"),
                .product(name: "CwlPreconditionTesting", package: "CwlPreconditionTesting"),
                .product(name: "Nimble", package: "Nimble")
            ],
            path: "LaunchDarkly",
            exclude: ["LaunchDarklyTests/Info.plist", "LaunchDarklyTests/.swiftlint.yml"],
            sources: ["GeneratedCode", "LaunchDarklyTests"]),
    ],
    swiftLanguageModes: [.v5])
