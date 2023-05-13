import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.makeModule(
//     name: "NoticeFeature",
//     product: .staticFramework,
//     dependencies: [
//         .Feature.BaseFeature
//     ]
// )
let project = Project.makeModule(
    name: "NoticeFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
