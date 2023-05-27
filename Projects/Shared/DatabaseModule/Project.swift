import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DatabaseModule",
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.UtilityModule
    ]
)
