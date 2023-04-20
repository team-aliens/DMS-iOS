import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DomainModule",
    product: .framework,
    dependencies: [
        .Project.Module.ThirdPartyLib,
        .Project.Service.DataMappingModule
    ]
)
