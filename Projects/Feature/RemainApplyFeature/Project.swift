import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.makeModule(
//     name: "RemainApplyFeature",
//     product: .staticFramework,
//     dependencies: [
//         .Feature.BaseFeature
//     ]
// )
let project = Project.makeModule(
    name: "RemainApplyFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
