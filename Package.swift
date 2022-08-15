// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Glaip",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(
      name: "Glaip",
      targets: ["Glaip"]),
  ],
  dependencies: [
    .package(url: "https://github.com/WalletConnect/WalletConnectSwift.git", .upToNextMinor(from: "1.7.0"))
  ],
  targets: [
    .target(
      name: "Glaip",
      dependencies: ["WalletConnectSwift"]),

  ]
)
