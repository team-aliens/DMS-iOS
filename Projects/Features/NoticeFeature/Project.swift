import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "NoticeFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature
    ]
)
