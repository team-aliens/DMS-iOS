import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "BaseDomain",
    product: .framework,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.ThirdPartyLib,
        .Shared.Utility
    ]
)
