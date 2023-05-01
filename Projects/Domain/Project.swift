import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "Domain",
    product: .framework,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.ThirdPartyLib,
        .Shared.Utility
    ]
)
