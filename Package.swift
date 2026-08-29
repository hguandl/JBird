// swift-tools-version: 6.3

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "JBird",
    platforms: [
        .macOS(.v13),
        .macCatalyst(.v16),
        .iOS(.v16),
        .watchOS(.v9),
        .tvOS(.v16),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "JBird",
            targets: [
                "JBird"
            ]
        ),
        .library(
            name: "JBirdCore",
            targets: [
                "JBirdCore"
            ]
        ),
        .library(
            name: "JBirdBuilders",
            targets: [
                "JBirdBuilders"
            ]
        ),
        .library(
            name: "JBirdMacros",
            targets: [
                "JBirdMacros"
            ]
        ),
        .library(
            name: "JBirdCodableSupport",
            targets: [
                "JBirdCodableSupport"
            ]
        )
    ],
    traits: [
        .default(enabledTraits: ["DeclarativeAPI", "ConformanceMacros", "CodableSupport"]),
        "DeclarativeAPI",
        "ConformanceMacros",
        "CodableSupport"
    ],
    dependencies: [
        .package(
            url: "https://github.com/swiftlang/swift-syntax.git",
            exact: "603.0.2"
        ),
        .package(
            url: "https://github.com/swiftlang/swift-docc-plugin.git",
            exact: "1.5.0"
        ),
        .package(
            url: "https://github.com/nicklockwood/SwiftFormat.git",
            exact: "0.61.1"
        )
    ],
    targets: [
        .target(
            name: "JBird",
            dependencies: [
                "JBirdCore",
                .target(
                    name: "JBirdBuilders",
                    condition: .when(
                        traits: ["DeclarativeAPI"]
                    )
                ),
                .target(
                    name: "JBirdMacros",
                    condition: .when(
                        traits: ["ConformanceMacros"]
                    )
                ),
                .target(
                    name: "JBirdCodableSupport",
                    condition: .when(
                        traits: ["CodableSupport"]
                    )
                )
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .testTarget(
            name: "JBirdTests",
            dependencies: [
                "JBird"
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .target(
            name: "JBirdCore",
            dependencies: [
                "JBirdParser"
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .testTarget(
            name: "JBirdCoreTests",
            dependencies: [
                "JBirdCore",
                "JBirdParser"
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .target(
            name: "JBirdParser",
            publicHeadersPath: "include",
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .testTarget(
            name: "JBirdParserTests",
            dependencies: [
                "JBirdParser"
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .target(
            name: "JBirdBuilders",
            dependencies: [
                "JBirdCore"
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .testTarget(
            name: "JBirdBuildersTests",
            dependencies: [
                "JBirdBuilders",
                "JBirdCore"
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .target(
            name: "JBirdMacros",
            dependencies: [
                "JBirdMacrosCompilerPlugin",
                "JBirdCore",
                "JBirdBuilders"
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .testTarget(
            name: "JBirdMacrosTests",
            dependencies: [
                "JBirdMacros",
                "JBirdCore",
                "JBirdBuilders"
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .macro(
            name: "JBirdMacrosCompilerPlugin",
            dependencies: [
                .product(
                    name: "SwiftCompilerPlugin",
                    package: "swift-syntax"
                ),
                .product(
                    name: "SwiftSyntax",
                    package: "swift-syntax"
                ),
                .product(
                    name: "SwiftSyntaxBuilder",
                    package: "swift-syntax"
                ),
                .product(
                    name: "SwiftSyntaxMacros",
                    package: "swift-syntax"
                )
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .testTarget(
            name: "JBirdMacrosCompilerPluginTests",
            dependencies: [
                "JBirdMacrosCompilerPlugin",
                .product(
                    name: "SwiftSyntaxMacrosTestSupport",
                    package: "swift-syntax"
                )
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .target(
            name: "JBirdCodableSupport",
            dependencies: [
                "JBirdCore"
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        ),
        .testTarget(
            name: "JBirdCodableSupportTests",
            dependencies: [
                "JBirdCodableSupport",
                "JBirdCore"
            ],
            swiftSettings: [
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("ExistentialAny")
            ]
        )
    ],
    swiftLanguageModes: [.v6],
    cLanguageStandard: .c11
)
