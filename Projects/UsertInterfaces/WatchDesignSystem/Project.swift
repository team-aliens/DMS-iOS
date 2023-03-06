import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "WatchDesignSystem",
    platform: .watchOS,
    product: .framework,
    deploymentTarget: .watchOS(targetVersion: "7.0"),
    dependencies: [],
    testDependencies: [],
    resources: ["Resources/**"]
)