import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.makeModule(
//    name: "MyPageFeature",
//    product: .staticFramework,
//    dependencies: [
//        .Feature.BaseFeature
//    ]
//)
let project = Project.makeModule(
    name: "MyPageFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
