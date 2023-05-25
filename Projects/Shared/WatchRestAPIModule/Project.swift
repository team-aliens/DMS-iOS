import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "WatchRestAPIModule",
    platform: .watchOS,
    product: .staticLibrary,
    targets: [],
    deploymentTarget: .watchOS(targetVersion: "9.4"),
    externalDependencies: [
        .SPM.Moya
    ]
)
