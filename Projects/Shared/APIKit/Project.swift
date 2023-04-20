import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "APIKit",
    product: .staticFramework,
    dependencies: [
        .Shared.ThirdPartyLib,
        .Shared.KeychainModule,
        .Shared.ErrorModule,
        .Shared.DataMappingModule,

        .SPM.Moya,
        .SPM.CombineMoya
    ]
)
