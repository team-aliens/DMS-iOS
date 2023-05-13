import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.makeModule(
//     name: "RenewalPasswordFeature",
//     product: .staticFramework,
//     dependencies: [
//         .Feature.BaseFeature
//     ]
// )
let project = Project.makeModule(
    name: "RenewalPasswordFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
