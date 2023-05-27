import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "NetworkModule",
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.APIKit,
        .Shared.Domain,
        .Shared.UtilityModule
    ]
)
