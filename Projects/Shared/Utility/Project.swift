import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Utility",
    product: .framework,
    dependencies: [
        .Shared.ThirdPartyLib,
        .Shared.ErrorModule
    ]
)
