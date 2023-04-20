import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DataModule",
    product: .staticFramework,
    dependencies: [
        .Shared.Domain,
        .Shared.DatabaseModule,
        .Shared.NetworkModule
    ]
)
