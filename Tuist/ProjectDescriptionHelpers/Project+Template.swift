import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

public enum MicroFeatureTarget {
    case interface
    case testing
    case unitTest
    case uiTest
    case demo
}

public extension Project {
    @available(*, deprecated)
    static func makeModule(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = env.deploymentTarget,
        dependencies: [TargetDependency] = [],
        testDependencies: [TargetDependency] = [.SPM.Quick, .SPM.Nimble],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        demoResources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default,
        hasDemoApp: Bool = false
    ) -> Project {
        return project(
            name: name,
            platform: platform,
            product: product,
            packages: packages,
            deploymentTarget: deploymentTarget,
            dependencies: dependencies,
            testDependencies: testDependencies,
            sources: sources,
            resources: resources,
            demoResources: demoResources,
            infoPlist: infoPlist,
            hasDemoApp: hasDemoApp
        )
    }
    
    static func makeModule(
        name: String,
        platform: Platform = env.platform,
        product: Product,
        targets: Set<MicroFeatureTarget>,
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = env.deploymentTarget,
        externalDependencies: [TargetDependency] = [],
        internalDependencies: [TargetDependency] = [],
        interfaceDependencies: [TargetDependency] = [],
        testingDependencies: [TargetDependency] = [],
        unitTestDependencies: [TargetDependency] = [],
        uiTestDependencies: [TargetDependency] = [],
        demoDependencies: [TargetDependency] = [],
        sources: SourceFilesList = .sources,
        resources: ResourceFileElements? = nil,
        settings: SettingsDictionary = [:],
        additionalPlistRows: [String: ProjectDescription.InfoPlist.Value] = [:],
        additionalFiles: [FileElement] = []
    ) -> Project {
        let scripts: [TargetScript] = isCI ? [] : [.swiftLint]
        let ldFlagsSettings: SettingsDictionary = product == .framework ?
        ["OTHER_LDFLAGS": .string("$(inherited) -all_load")] :
        ["OTHER_LDFLAGS": .string("$(inherited)")]

        let configurations: [Configuration] = isCI ?
        [
          .debug(name: .dev),
          .debug(name: .stage),
          .release(name: .prod)
        ] :
        [
          .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: name)),
          .debug(name: .stage, xcconfig: .relativeToXCConfig(type: .stage, name: name)),
          .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: name))
        ]

        let settings: Settings = .settings(
            base: env.baseSetting
                .merging(.codeSign)
                .merging(settings)
                .merging(ldFlagsSettings),
            configurations: configurations,
            defaultSettings: .recommended
        )
        var allTargets: [Target] = []
        var dependencies = internalDependencies + externalDependencies

        // MARK: - Interface
        if targets.contains(.interface) {
            dependencies.append(.target(name: "\(name)Interface"))
            allTargets.append(
                Target(
                    name: "\(name)Interface",
                    platform: platform,
                    product: .framework,
                    bundleId: "\(env.organizationName).\(name)Interface",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .default,
                    sources: .interface,
                    scripts: scripts,
                    dependencies: interfaceDependencies,
                    additionalFiles: additionalFiles
                )
            )
        }

        // MARK: - Sources
        allTargets.append(
            Target(
                name: name,
                platform: platform,
                product: product,
                bundleId: "\(env.organizationName).\(name)",
                deploymentTarget: deploymentTarget,
                infoPlist: .extendingDefault(with: additionalPlistRows),
                sources: sources,
                resources: resources,
                scripts: scripts,
                dependencies: dependencies
            )
        )

        // MARK: - Testing
        if targets.contains(.testing) && targets.contains(.interface) {
            allTargets.append(
                Target(
                    name: "\(name)Testing",
                    platform: platform,
                    product: .framework,
                    bundleId: "\(env.organizationName).\(name)Testing",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .default,
                    sources: .testing,
                    scripts: scripts,
                    dependencies: [
                        .target(name: "\(name)Interface")
                    ] + testingDependencies
                )
            )
        }

        var testTargetDependencies = [
            targets.contains(.demo) ?
                TargetDependency.target(name: "\(name)DemoApp") :
                TargetDependency.target(name: name)
        ]
        if targets.contains(.testing) {
            testTargetDependencies.append(.target(name: "\(name)Testing"))
        }

        // MARK: - Unit Test
        if targets.contains(.unitTest) {
            allTargets.append(
                Target(
                    name: "\(name)Tests",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(env.organizationName).\(name)Tests",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .default,
                    sources: .unitTests,
                    scripts: scripts,
                    dependencies: testTargetDependencies + unitTestDependencies
                )
            )
        }

        // MARK: - UI Test
        if targets.contains(.uiTest) {
            allTargets.append(
                Target(
                    name: "\(name)UITests",
                    platform: platform,
                    product: .uiTests,
                    bundleId: "\(env.organizationName).\(name)UITests",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .default,
                    scripts: scripts,
                    dependencies: testTargetDependencies + uiTestDependencies
                )
            )
        }

        // MARK: - Demo App
        if targets.contains(.demo) {
            var demoDependencies = demoDependencies
            demoDependencies.append(.target(name: name))
            if targets.contains(.testing) {
                demoDependencies.append(.target(name: "\(name)Testing"))
            }
            allTargets.append(
                Target(
                    name: "\(name)DemoApp",
                    platform: platform,
                    product: .app,
                    bundleId: "\(env.organizationName).\(name)DemoApp",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .extendingDefault(with: [
                        "UIMainStoryboardFile": "",
                        "UILaunchStoryboardName": "LaunchScreen",
                        "ENABLE_TESTS": .boolean(true),
                    ]),
                    sources: .demoSources,
                    resources: ["Demo/Resources/**"],
                    scripts: scripts,
                    dependencies: demoDependencies
                )
            )
        }

        let schemes: [Scheme] = targets.contains(.demo) ?
        [.makeScheme(target: .dev, name: name), .makeDemoScheme(target: .dev, name: name)] :
        [.makeScheme(target: .dev, name: name)]

        return Project(
            name: name,
            organizationName: env.organizationName,
            packages: packages,
            settings: settings,
            targets: allTargets,
            schemes: schemes
        )
    }
}

public extension Project {
    @available(*, deprecated)
    static func project(
        name: String,
        platform: Platform,
        product: Product,
        organizationName: String = env.organizationName,
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = env.deploymentTarget,
        dependencies: [TargetDependency] = [],
        testDependencies: [TargetDependency] = [],
        sources: SourceFilesList,
        resources: ResourceFileElements? = nil,
        demoResources: ResourceFileElements? = nil,
        infoPlist: InfoPlist,
        hasDemoApp: Bool = false
    ) -> Project {
        let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false
        let scripts: [TargetScript] = isCI ? [] : [.swiftLint]
        let settings: Settings = .settings(
            base: env.baseSetting,
            configurations: [
                .debug(name: .dev, xcconfig: isCI ? nil : .relativeToXCConfig(type: .dev, name: name)),
                .release(name: .prod, xcconfig: isCI ? nil : .relativeToXCConfig(type: .prod, name: name))
            ], defaultSettings: .recommended)
        let appTarget = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            scripts: scripts,
            dependencies: dependencies
        )
        let demoSource: SourceFilesList = ["Demo/Sources/**"]
        let demoSources: SourceFilesList = SourceFilesList(globs: sources.globs + demoSource.globs)

        let demoAppTarget = Target(
            name: "\(name)DemoApp",
            platform: platform,
            product: .app,
            bundleId: "\(organizationName).\(name)DemoApp",
            deploymentTarget: env.deploymentTarget,
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true),
            ]),
            sources: demoSources,
            resources: ["Demo/Resources/**"],
            scripts: scripts,
            dependencies: [
                .target(name: name)
            ]
        )

        let schemes: [Scheme] = hasDemoApp
        ? [.makeScheme(target: .dev, name: name), .makeDemoScheme(target: .dev, name: name)]
        : [.makeScheme(target: .dev, name: name)]

        let testTargetDependencies: [TargetDependency] = hasDemoApp
        ? [.target(name: "\(name)DemoApp")]
        : [.target(name: name)]

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(organizationName).\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: testTargetDependencies + testDependencies
        )

        let targets: [Target] = hasDemoApp
        ? [appTarget, testTarget, demoAppTarget]
        : [appTarget, testTarget]

        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
    static func makeDemoScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)DemoApp"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)DemoApp"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}

//import ProjectDescription
//import UtilityPlugin
//import Foundation
//
//public extension Project {
//    @available(*, deprecated)
//    static func makeModule(
//        name: String,
//        platform: Platform = .iOS,
//        product: Product,
//        packages: [Package] = [],
//        deploymentTarget: DeploymentTarget? = Environment.deploymentTarget,
//        dependencies: [TargetDependency] = [],
//        testDependencies: [TargetDependency] = [.SPM.Quick, .SPM.Nimble],
//        sources: SourceFilesList = ["Sources/**"],
//        resources: ResourceFileElements? = nil,
//        demoResources: ResourceFileElements? = nil,
//        infoPlist: InfoPlist = .default,
//        hasDemoApp: Bool = false
//    ) -> Project {
//        return project(
//            name: name,
//            platform: platform,
//            product: product,
//            packages: packages,
//            deploymentTarget: deploymentTarget,
//            dependencies: dependencies,
//            testDependencies: testDependencies,
//            sources: sources,
//            resources: resources,
//            demoResources: demoResources,
//            infoPlist: infoPlist,
//            hasDemoApp: hasDemoApp
//        )
//    }
//}
//
//public extension Project {
//    static func project(
//        name: String,
//        platform: Platform,
//        product: Product,
//        organizationName: String = Environment.organizationName,
//        packages: [Package] = [],
//        deploymentTarget: DeploymentTarget? = Environment.deploymentTarget,
//        dependencies: [TargetDependency] = [],
//        testDependencies: [TargetDependency] = [],
//        sources: SourceFilesList,
//        resources: ResourceFileElements? = nil,
//        demoResources: ResourceFileElements? = nil,
//        infoPlist: InfoPlist,
//        hasDemoApp: Bool = false
//    ) -> Project {
//        let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false
//        let scripts: [TargetScript] = isCI ? [] : [.swiftLint]
//        let settings: Settings = .settings(
//            base: Environment.baseSetting,
//            configurations: [
//                .debug(name: .dev, xcconfig: isCI ? nil : .relativeToXCConfig(type: .dev, name: name)),
//                .release(name: .prod, xcconfig: isCI ? nil : .relativeToXCConfig(type: .prod, name: name))
//            ], defaultSettings: .recommended)
//        let appTarget = Target(
//            name: name,
//            platform: platform,
//            product: product,
//            bundleId: "\(organizationName).\(name)",
//            deploymentTarget: deploymentTarget,
//            infoPlist: infoPlist,
//            sources: sources,
//            resources: resources,
//            scripts: scripts,
//            dependencies: dependencies
//        )
//        let demoSource: SourceFilesList = ["Demo/Sources/**"]
//        let demoSources: SourceFilesList = SourceFilesList(globs: sources.globs + demoSource.globs)
//
//        let demoAppTarget = Target(
//            name: "\(name)DemoApp",
//            platform: platform,
//            product: .app,
//            bundleId: "\(organizationName).\(name)DemoApp",
//            deploymentTarget: Environment.deploymentTarget,
//            infoPlist: .extendingDefault(with: [
//                "UIMainStoryboardFile": "",
//                "UILaunchStoryboardName": "LaunchScreen",
//                "ENABLE_TESTS": .boolean(true),
//            ]),
//            sources: demoSources,
//            resources: ["Demo/Resources/**"],
//            scripts: scripts,
//            dependencies: [
//                .target(name: name)
//            ]
//        )
//
//        let schemes: [Scheme] = hasDemoApp
//        ? [.makeScheme(target: .dev, name: name), .makeDemoScheme(target: .dev, name: name)]
//        : [.makeScheme(target: .dev, name: name)]
//
//        let testTargetDependencies: [TargetDependency] = hasDemoApp
//        ? [.target(name: "\(name)DemoApp")]
//        : [.target(name: name)]
//
//        let testTarget = Target(
//            name: "\(name)Tests",
//            platform: platform,
//            product: .unitTests,
//            bundleId: "\(organizationName).\(name)Tests",
//            deploymentTarget: deploymentTarget,
//            infoPlist: .default,
//            sources: ["Tests/**"],
//            dependencies: testTargetDependencies + testDependencies
//        )
//
//        let targets: [Target] = hasDemoApp
//        ? [appTarget, testTarget, demoAppTarget]
//        : [appTarget, testTarget]
//
//        return Project(
//            name: name,
//            organizationName: organizationName,
//            packages: packages,
//            settings: settings,
//            targets: targets,
//            schemes: schemes
//        )
//    }
//}
//
//extension Scheme {
//    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
//        return Scheme(
//            name: name,
//            shared: true,
//            buildAction: .buildAction(targets: ["\(name)"]),
//            testAction: .targets(
//                ["\(name)Tests"],
//                configuration: target,
//                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
//            ),
//            runAction: .runAction(configuration: target),
//            archiveAction: .archiveAction(configuration: target),
//            profileAction: .profileAction(configuration: target),
//            analyzeAction: .analyzeAction(configuration: target)
//        )
//    }
//    static func makeDemoScheme(target: ConfigurationName, name: String) -> Scheme {
//        return Scheme(
//            name: name,
//            shared: true,
//            buildAction: .buildAction(targets: ["\(name)DemoApp"]),
//            testAction: .targets(
//                ["\(name)Tests"],
//                configuration: target,
//                options: .options(coverage: true, codeCoverageTargets: ["\(name)DemoApp"])
//            ),
//            runAction: .runAction(configuration: target),
//            archiveAction: .archiveAction(configuration: target),
//            profileAction: .profileAction(configuration: target),
//            analyzeAction: .analyzeAction(configuration: target)
//        )
//    }
//}
