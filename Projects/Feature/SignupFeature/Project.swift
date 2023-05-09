import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.makeModule(
//    name: "SignupFeature",
//    product: .staticFramework,
//    dependencies: [
//        .Feature.BaseFeature
//    ],
//    testDependencies: [
//        .Shared.Data
//    ]
//)
let project = Project.makeModule(
    name: "SignupFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ],
    unitTestDependencies: [
        .Shared.Data
    ]
)

