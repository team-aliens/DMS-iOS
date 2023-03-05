import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MainTabFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature,
        .Project.Features.HomeFeature,
        .Project.Features.ApplyFeature,
        .Project.Features.NoticeFeature,
        .Project.Features.MyPageFeature
    ]
)
