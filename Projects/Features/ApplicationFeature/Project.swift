import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ApplicationFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature
    ]
)