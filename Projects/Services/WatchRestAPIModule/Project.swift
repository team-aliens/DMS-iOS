import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "WatchRestAPIModule",
    platform: .watchOS,
    product: .staticLibrary,
    deploymentTarget: .watchOS(targetVersion: "7.0"),
    dependencies: [
        .SPM.Moya
    ],
    testDependencies: []
)
