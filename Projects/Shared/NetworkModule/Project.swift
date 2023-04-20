import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "NetworkModule",
    product: .staticFramework,
    dependencies: [
        .Project.Shared.Utility,
        .Project.Shared.APIKit,
        .Project.Shared.Domain
    ]
)
