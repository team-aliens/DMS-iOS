import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.makeModule(
//    name: "NetworkModule",
//    product: .staticFramework,
//    dependencies: [
//        .Shared.Utility,
//        .Shared.APIKit,
//        .Shared.Domain
//    ]
//)
let project = Project.makeModule(
    name: "NetworkModule",
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.APIKit,
        .Shared.Domain,
        .Shared.Utility
    ]
)
