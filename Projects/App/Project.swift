import ProjectDescriptionHelpers
import ProjectDescription
import DependencyPlugin
import EnvironmentPlugin
import Foundation

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

let settinges: Settings =
    .settings(base: Environment.baseSetting,
              configurations: [
                .debug(name: .dev, xcconfig: isCI ? nil : .relativeToXCConfig(
                    type: .dev,
                    name: Environment.targetName)
                ),
                .release(name: .prod, xcconfig: isCI ? nil : .relativeToXCConfig(
                    type: .prod,
                    name: Environment.targetName)
                )
              ],
              defaultSettings: .recommended)

let scripts: [TargetScript] = isCI ? [] : [.swiftLint, .widgetNeedle, .needle]
let widgetScripts: [TargetScript] = isCI ? [] : [.widgetNeedle]

let targets: [Target] = [
    .init(
        name: Environment.targetName,
        platform: .iOS,
        product: .app,
        productName: Environment.appName,
        bundleId: "\(Environment.organizationName).\(Environment.targetName)",
        deploymentTarget: Environment.deploymentTarget,
        infoPlist: .file(path: "Support/Info.plist"),
        sources: ["Sources/**", "AppExtension/Sources/**/*.intentdefinition"],
        resources: ["Resources/**"],
        entitlements: "Support/\(Environment.appName).entitlements",
        scripts: scripts,
        dependencies: [
            .Shared.Data,
            .Feature.RootFeature,
            .target(name: "\(Environment.appName)Widget"),
            .target(name: "\(Environment.appName)WatchApp")
        ],
        settings: .settings(base: Environment.baseSetting)
    ),
    .init(
        name: Environment.targetTestName,
        platform: .iOS,
        product: .unitTests,
        bundleId: "\(Environment.organizationName).\(Environment.targetName)Tests",
        deploymentTarget: Environment.deploymentTarget,
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [
            .target(name: Environment.targetName)
        ]
    ),
    .init(
        name: "\(Environment.appName)Widget",
        platform: .iOS,
        product: .appExtension,
        bundleId: "\(Environment.organizationName).\(Environment.targetName).WidgetExtension",
        deploymentTarget: Environment.deploymentTarget,
        infoPlist: .file(path: "AppExtension/Support/Widget-Info.plist"),
        sources: ["AppExtension/Sources/**"],
        resources: ["AppExtension/Resources/**"],
        entitlements: "AppExtension/Support/\(Environment.appName)Widget.entitlements",
        scripts: widgetScripts,
        dependencies: [
            .Core.DesignSystem,
            .Shared.Data,
            .SPM.Needle
        ]
    ),
    .init(
        name: "\(Environment.targetName)WatchApp",
        platform: .watchOS,
        product: .watch2App,
        productName: "\(Environment.appName)WatchApp",
        bundleId: "\(Environment.organizationName).\(Environment.targetName).watchkitapp",
        deploymentTarget: .watchOS(targetVersion: "7.0"),
        infoPlist: .file(path: "WatchApp/Support/Info.plist"),
        resources: ["WatchApp/Resources/**"],
        dependencies: [
            .target(name: "\(Environment.targetName)WatchExtension")
        ]
    ),
    .init(
        name: "\(Environment.targetName)WatchExtension",
        platform: .watchOS,
        product: .watch2Extension,
        productName: "\(Environment.appName)WatchExtension",
        bundleId: "\(Environment.organizationName).\(Environment.targetName).watchkitapp.extension",
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
      name: "\(Environment.targetName)-DEV",
      shared: true,
      buildAction: .buildAction(targets: ["\(Environment.targetName)"]),
      testAction: TestAction.targets(
          ["\(Environment.targetTestName)"],
          configuration: .dev,
          options: TestActionOptions.options(
              coverage: true,
              codeCoverageTargets: ["\(Environment.targetName)"]
          )
      ),
      runAction: .runAction(configuration: .dev),
      archiveAction: .archiveAction(configuration: .dev),
      profileAction: .profileAction(configuration: .dev),
      analyzeAction: .analyzeAction(configuration: .dev)
    ),
    .init(
      name: "\(Environment.targetName)-PROD",
      shared: true,
      buildAction: BuildAction(targets: ["\(Environment.targetName)"]),
      testAction: nil,
      runAction: .runAction(configuration: .prod),
      archiveAction: .archiveAction(configuration: .prod),
      profileAction: .profileAction(configuration: .prod),
      analyzeAction: .analyzeAction(configuration: .prod)
    )
]

let project: Project =
    .init(
        name: Environment.targetName,
        organizationName: Environment.organizationName,
        settings: settinges,
        targets: targets,
        schemes: schemes
    )
