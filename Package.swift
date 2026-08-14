// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftVietQRBase",
    platforms: [.macOS(.v10_13), .iOS(.v12), .tvOS(.v12), .watchOS(.v4)],
    products: [
        .library(
            name: "SwiftVietQRBase",
            targets: ["SwiftVietQRBase"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nhenhe1012/swift-emv-format-parser.git", branch: "master")
    ],
    targets: [
        .target(
            name: "SwiftVietQRBase",
            dependencies: [.product(name: "SwiftEmvFormatParser", package: "swift-emv-format-parser")]),
        .testTarget(
            name: "SwiftVietQRBaseTests",
            dependencies: ["SwiftVietQRBase"]
        ),
    ]
)
