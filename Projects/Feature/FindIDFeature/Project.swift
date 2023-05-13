import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.makeModule(
//     name: "FindIDFeature",
//     product: .staticFramework,
//     dependencies: [
//         .Feature.BaseFeature
//     ]
// )
let project = Project.makeModule(
    name: "FindIDFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
