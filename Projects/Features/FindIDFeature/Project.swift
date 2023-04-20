import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "FindIDFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature
    ]
)
