import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.makeModule(
//    name: "DatabaseModule",
//    product: .staticFramework,
//    dependencies: [
//        .Shared.Utility
//    ]
//)
let project = Project.makeModule(
    name: "DatabaseModule",
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.Utility
    ]
)
