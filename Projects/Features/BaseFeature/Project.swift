import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "BaseFeature",
    product: .framework,
    dependencies: [
        .Project.Service.Domain,
        .Project.Module.Utility,
        .Project.Module.FeatureThirdPartyLib,
        .Project.UserInterfaces.DesignSystem
    ]
)
