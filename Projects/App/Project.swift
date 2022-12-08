import ProjectDescriptionHelpers
import ProjectDescription
import UtilityPlugin
import Foundation

let settinges: Settings =
    .settings(base: Environment.baseSetting,
              configurations: [
                .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: Environment.targetName)),
                .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: Environment.targetName))
              ],
              defaultSettings: .recommended)

let isForDev = (ProcessInfo.processInfo.environment["TUIST_DEV"] ?? "0") == "1" ? true : false

let scripts: [TargetScript] = isForDev ? [.swiftLint, .needle] : []

let targets: [Target] = [
    .init(
        name: Environment.targetName,
        platform: .iOS,
        product: .app,
        productName: Environment.appName,
        bundleId: "\(Environment.organizationName).\(Environment.targetName)",
        deploymentTarget: Environment.deploymentTarget,
        infoPlist: .file(path: "Support/Info.plist"),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        scripts: scripts,
        dependencies: [
            .Project.Features.RootFeature,
            .Project.Service.Data
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
