import ProjectDescriptionHelpers
import ProjectDescription
import UtilityPlugin
import Foundation

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

let settinges: Settings = .settings(
    base: Environment.baseSetting,
    configurations: [
        .debug(name: .dev, xcconfig: isCI ? nil : .relativeToXCConfig(
            type: .dev,
            name: "\(Environment.targetName)WatchApp")
        ),
        .release(name: .prod, xcconfig: isCI ? nil : .relativeToXCConfig(
            type: .prod,
            name: "\(Environment.targetName)WatchApp")
        )
    ],
    defaultSettings: .recommended
)

let watchSettings: Settings = .settings(
    base: Environment.watchSetting
)

let scripts: [TargetScript] = isCI ? [] : [.swiftLint]

let targets: [Target] = [
    .init(
        name: "\(Environment.targetName)WatchApp",
        platform: .watchOS,
        product: .watch2App,
        productName: Environment.appName,
        bundleId: "\(Environment.organizationName).\(Environment.targetName).watchkitapp",
        deploymentTarget: .watchOS(targetVersion: "7.0"),
        infoPlist: .file(path: "Support/Info.plist"),
        resources: ["Resources/**"],
        dependencies: [
            .target(name: "\(Environment.targetName)Watch")
        ]
    ),
    .init(
        name: "\(Environment.targetName)Watch",
        platform: .watchOS,
        product: .watch2Extension,
        productName: Environment.appName,
        bundleId: "\(Environment.organizationName).\(Environment.targetName).watchkitapp.extension",
        deploymentTarget: .watchOS(targetVersion: "7.0"),
        infoPlist: .file(path: "Support/Info.plist"),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        scripts: scripts,
        dependencies: [
            .Project.UserInterfaces.WatchDesignSystem,
            .Project.Service.WatchRestAPIModule,

            .SPM.Swinject
        ],
        settings: .settings(base: Environment.baseSetting)
    )
]

let schemes: [Scheme] = [
    .init(
      name: "\(Environment.targetName)Watch-DEV",
      shared: true,
      buildAction: .buildAction(targets: ["\(Environment.targetName)WatchApp"]),
      testAction: nil,
      runAction: .runAction(configuration: .dev),
      archiveAction: .archiveAction(configuration: .dev),
      profileAction: .profileAction(configuration: .dev),
      analyzeAction: .analyzeAction(configuration: .dev)
    ),
    .init(
      name: "\(Environment.targetName)Watch-PROD",
      shared: true,
      buildAction: BuildAction(targets: ["\(Environment.targetName)WatchApp"]),
      testAction: nil,
      runAction: .runAction(configuration: .prod),
      archiveAction: .archiveAction(configuration: .prod),
      profileAction: .profileAction(configuration: .prod),
      analyzeAction: .analyzeAction(configuration: .prod)
    )
]

let project: Project =
    .init(
        name: "\(Environment.targetName)WatchApp",
        organizationName: Environment.organizationName,
        settings: settinges,
        targets: targets,
        schemes: schemes
    )
