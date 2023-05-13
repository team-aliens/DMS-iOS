import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.makeModule(
//     name: "APIKit",
//     product: .staticFramework,
//     dependencies: [
//         .Shared.ThirdPartyLib,
//         .Shared.KeychainModule,
//         .Shared.ErrorModule,
//         .Shared.DataMappingModule,
//
//         .SPM.Moya,
//         .SPM.CombineMoya
//     ]
// )
let project = Project.makeModule(
    name: "APIKit",
    product: .staticLibrary,
    targets: [.unitTest],
    externalDependencies: [
        .SPM.Moya,
        .SPM.CombineMoya
    ],
    internalDependencies: [
        .Shared.DataMappingModule,
        .Shared.ErrorModule,
        .Shared.KeychainModule,
        .Shared.ThirdPartyLib
    ]
)
