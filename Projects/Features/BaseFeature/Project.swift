import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "BaseFeature",
    product: .framework,
    dependencies: [
        .Project.Service.Domain,
        .Project.Shared.Utility,
        .Project.Shared.FeatureThirdPartyLib,
        .Project.Core.DesignSystem
    ]
)
