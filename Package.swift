// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FileManagerClient",
    platforms: [.iOS(.v14), .macOS(.v11), .tvOS(.v13), .watchOS(.v6)],
    products: [
      .singleTargetLibrary("FileManagerClient"),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.0.0"),
//        .package(url: "https://github.com/tgrapperon/swift-dependencies-additions", from: "1.0.1"),
    ],
    targets: [
      
      .target(
        name: "FileManagerClient",
        dependencies: [
          .product(name: "Dependencies", package: "swift-dependencies"),
          .product(name: "DependenciesMacros", package: "swift-dependencies"),
        ]),
      
      // MARK: Tests
//      .testTarget(
//        name: "FileManagerClientTests",
//        dependencies: ["FileManagerClient"]
//      ),
    ]
)

extension Product {
  static func singleTargetLibrary(_ name: String) -> Product {
    .library(name: name, targets: [name])
  }
}
