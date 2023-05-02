import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "RenewalPasswordFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature
    ]
)
