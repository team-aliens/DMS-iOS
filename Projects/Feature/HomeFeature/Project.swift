import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.makeModule(
//    name: "HomeFeature",
//    product: .staticFramework,
//    dependencies: [
//        .Feature.BaseFeature
//    ]
//)
let project = Project.makeModule(
    name: "HomeFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
