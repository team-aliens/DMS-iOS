import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "WatchRestAPIModule",
    platform: .watchOS,
    product: .staticLibrary,
    targets: [],
    deploymentTarget: .watchOS(targetVersion: "9.0"),
    externalDependencies: [
        .SPM.Moya
    ]
)
