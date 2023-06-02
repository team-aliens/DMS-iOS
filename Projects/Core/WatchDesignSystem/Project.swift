import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "WatchDesignSystem",
    platform: .watchOS,
    product: .framework,
    targets: [],
    deploymentTarget: .watchOS(targetVersion: "9.0"),
    resources: ["Resources/**"]
)
