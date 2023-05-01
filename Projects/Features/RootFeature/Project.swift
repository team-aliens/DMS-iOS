import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "RootFeature",
    product: .staticFramework,
    targets: [],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.SigninFeature,
        .Feature.MainTabFeature,
        .Feature.SplashFeature
    ]
)
//let project = Project.makeModule(
//    name: "RootFeature",
//    product: .staticFramework,
//    dependencies: [
//        .Feature.BaseFeature,
//        .Feature.SigninFeature,
//        .Feature.MainTabFeature,
//        .Feature.SplashFeature
//    ]
//)
