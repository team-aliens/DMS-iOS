import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.makeModule(
//     name: "SplashFeature",
//     product: .staticFramework,
//     dependencies: [
//         .Feature.BaseFeature
//     ]
// )
let project = Project.makeModule(
    name: "SplashFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
