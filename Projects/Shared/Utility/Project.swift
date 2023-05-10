import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.makeModule(
//    name: "Utility",
//    product: .framework,
//    dependencies: [
//        .Shared.ThirdPartyLib,
//        .Shared.ErrorModule
//    ]
//)
let project = Project.makeModule(
    name: "Utility",
    product: .framework,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.ErrorModule,
        .Shared.ThirdPartyLib
    ]
)
