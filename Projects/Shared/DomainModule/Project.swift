import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DomainModule",
    product: .staticFramework,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.DataMappingModule,
        .Shared.ThirdPartyLib
    ]
)
