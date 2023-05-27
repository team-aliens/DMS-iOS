import ProjectDescription
import ProjectDescriptionHelpers

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
        .Shared.GlobalThirdPartyLibrary
    ]
)
