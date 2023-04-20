import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DatabaseModule",
    product: .staticFramework,
    dependencies: [
        .Shared.Utility
    ]
)
