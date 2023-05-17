import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DataModule",
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.DatabaseModule,
        .Shared.Domain,
        .Shared.NetworkModule
    ]
)
