import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "RootFeature",
    product: .staticLibrary,
    targets: [],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.SigninFeature,
        .Feature.MainTabFeature,
        .Feature.SplashFeature
    ]
)
