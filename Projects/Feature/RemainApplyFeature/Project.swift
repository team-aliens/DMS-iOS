import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "RemainApplyFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature
    ])
