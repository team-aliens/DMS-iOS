import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ApplyFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature
    ]
)
