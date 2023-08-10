import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MainTabFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.HomeFeatureInterface,
        .Feature.ApplyFeatureInterface,
        .Feature.NoticeFeatureInterface,
        .Feature.MyPageFeatureInterface
    ]
)
