import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DomainModule",
    product: .framework,
    dependencies: [
        .Shared.ThirdPartyLib,
        .Shared.DataMappingModule
    ]
)
