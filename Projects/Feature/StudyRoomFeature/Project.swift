import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.makeModule(
//    name: "StudyRoomFeature",
//    product: .staticFramework,
//    dependencies: [
//        .Feature.BaseFeature
//    ])
let project = Project.makeModule(
    name: "StudyRoomFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
