import ProjectDescriptionHelpers
import ProjectDescription
import DependencyPlugin
import EnvironmentPlugin
import Foundation

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

// let settinges: Settings =
//    .settings(base: Environment.baseSetting,
//              configurations: [
//                .debug(name: .dev, xcconfig: isCI ? nil : .relativeToXCConfig(
//                    type: .dev,
//                    name: Environment.targetName)
//                ),
//                .release(name: .prod, xcconfig: isCI ? nil : .relativeToXCConfig(
//                    type: .prod,
//                    name: Environment.targetName)
//                )
//              ],
//              defaultSettings: .recommended)
let configurations: [Configuration] = [
    .debug(name: .dev, xcconfig: isCI ? nil : .relativeToXCConfig(type: .dev, name: env.targetName)),
    .debug(name: .stage, xcconfig: isCI ? nil : .relativeToXCConfig(type: .stage, name: env.targetName)),
    .release(name: .prod, xcconfig: isCI ? nil : .relativeToXCConfig(type: .prod, name: env.targetName))
  ]

let settings: Settings =
    .settings(base: env.baseSetting,
              configurations: configurations,
              defaultSettings: .recommended)

let scripts: [TargetScript] = isCI ? [] : [.swiftLint, .widgetNeedle, .needle]
let widgetScripts: [TargetScript] = isCI ? [] : [.widgetNeedle]

let targets: [Target] = [
    .init(
        name: env.targetName,
        platform: .iOS,
        product: .app,
        productName: env.appName,
        bundleId: "\(env.organizationName).\(env.targetName)",
        deploymentTarget: env.deploymentTarget,
        infoPlist: .file(path: "Support/Info.plist"),
        sources: ["Sources/**", "AppExtension/Sources/**/*.intentdefinition"],
        resources: ["Resources/**"],
        entitlements: "Support/\(env.appName).entitlements",
        scripts: scripts,
        dependencies: [
            .Domain.AuthDomain,
            .Feature.RootFeature,
            .Shared.Data,
            .target(name: "\(env.appName)Widget"),
            .target(name: "\(env.appName)WatchApp")
        ],
        settings: .settings(base: env.baseSetting)
    ),
    .init(
        name: env.targetTestName,
        platform: .iOS,
        product: .unitTests,
        bundleId: "\(env.organizationName).\(env.targetName)Tests",
        deploymentTarget: env.deploymentTarget,
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [
            .target(name: env.targetName)
        ]
    ),
    .init(
        name: "\(env.appName)Widget",
        platform: .iOS,
        product: .appExtension,
        bundleId: "\(env.organizationName).\(env.targetName).WidgetExtension",
        deploymentTarget: env.deploymentTarget,
        infoPlist: .file(path: "AppExtension/Support/Widget-Info.plist"),
        sources: ["AppExtension/Sources/**"],
        resources: ["AppExtension/Resources/**"],
        entitlements: "AppExtension/Support/\(env.appName)Widget.entitlements",
        scripts: widgetScripts,
        dependencies: [
            .Core.DesignSystem,
            .Shared.Data,
            .SPM.Needle
        ]
    ),
    .init(
        name: "\(env.targetName)WatchApp",
        platform: .watchOS,
        product: .watch2App,
        productName: "\(env.appName)WatchApp",
        bundleId: "\(env.organizationName).\(env.targetName).watchkitapp",
        deploymentTarget: .watchOS(targetVersion: "7.0"),
        infoPlist: .file(path: "WatchApp/Support/Info.plist"),
        resources: ["WatchApp/Resources/**"],
        dependencies: [
            .target(name: "\(env.targetName)WatchExtension")
        ]
    ),
    .init(
        name: "\(env.targetName)WatchExtension",
        platform: .watchOS,
        product: .watch2Extension,
        productName: "\(env.appName)WatchExtension",
        bundleId: "\(env.organizationName).\(env.targetName).watchkitapp.extension",
        deploymentTarget: .watchOS(targetVersion: "7.0"),
        infoPlist: .file(path: "WatchApp/Support/Extension-Info.plist"),
        sources: ["WatchApp/Sources/**"],
        resources: ["WatchApp/Resources/**"],
        scripts: scripts,
        dependencies: [
            .Core.WatchDesignSystem,
            .Shared.WatchRestAPIModule,
            .SPM.Swinject
        ]
    )
]

let schemes: [Scheme] = [
    .init(
      name: "\(env.targetName)-DEV",
      shared: true,
      buildAction: .buildAction(targets: ["\(env.targetName)"]),
      testAction: TestAction.targets(
          ["\(env.targetTestName)"],
          configuration: .dev,
          options: TestActionOptions.options(
              coverage: true,
              codeCoverageTargets: ["\(env.targetName)"]
          )
      ),
      runAction: .runAction(configuration: .dev),
      archiveAction: .archiveAction(configuration: .dev),
      profileAction: .profileAction(configuration: .dev),
      analyzeAction: .analyzeAction(configuration: .dev)
    ),
    .init(
      name: "\(env.targetName)-PROD",
      shared: true,
      buildAction: BuildAction(targets: ["\(env.targetName)"]),
      testAction: nil,
      runAction: .runAction(configuration: .prod),
      archiveAction: .archiveAction(configuration: .prod),
      profileAction: .profileAction(configuration: .prod),
      analyzeAction: .analyzeAction(configuration: .prod)
    ),
    .init(
      name: "\(env.targetName)-STAGE",
      shared: true,
      buildAction: BuildAction(targets: ["\(env.targetName)"]),
      testAction: nil,
      runAction: .runAction(configuration: .stage),
      archiveAction: .archiveAction(configuration: .stage),
      profileAction: .profileAction(configuration: .stage),
      analyzeAction: .analyzeAction(configuration: .stage)
    )
]

let project: Project =
    .init(
        name: env.targetName,
        organizationName: env.organizationName,
        settings: settings,
        targets: targets,
        schemes: schemes
    )
