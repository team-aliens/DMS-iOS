import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MainTabFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.HomeFeature,
        .Feature.ApplyFeature,
        .Feature.NoticeFeature,
        .Feature.MyPageFeature
    ]
)
