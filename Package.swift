// swift-tools-version: 5.6

import PackageDescription

// Add your modules here

let modules = [
    "Stdlib",
    "Foundation",
]

let package = Package(
    name: "SwifterSwift",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_10),
        .tvOS(.v9),
        .watchOS(.v2),
    ],
    products: products(modules),
    targets: targets(modules)
)

// MARK: - Private Helpers

private func products(_ modules: [String]) -> [Product] {
    let main = Product.library(name: "SwifterSwift", targets: ["SwifterSwift"])
    return [main] + modules.map(library(module:))
}

func library(module: String) -> Product {
    .library(name: "Swifter\(module)", targets: ["Swifter\(module)"])
}

func targets(_ modules: [String]) -> [Target] {
    let main = Target.target(
        name: "SwifterSwift",
        dependencies: modules.map { .init(stringLiteral: "Swifter\($0)") },
        path: "Sources/SwifterSwift"
    )
    return [main] + modules.map(target) + modules.map(testTarget)
}

func target(module: String) -> Target {
    return Target.target(name: "Swifter\(module)", path: "Sources/\(module)")
}

func testTarget(module: String) -> Target {
    return Target.testTarget(
        name: "\(module)Tests",
        dependencies: [.init(stringLiteral: "Swifter\(module)")],
        path: "Tests/\(module)"
    )
}
