import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "RootFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature,
        .Feature.SigninFeature,
        .Feature.MainTabFeature,
        .Feature.SplashFeature
    ]
)
