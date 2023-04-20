import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MainTabFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature,
        .Feature.HomeFeature,
        .Feature.ApplyFeature,
        .Feature.NoticeFeature,
        .Feature.MyPageFeature
    ]
)
