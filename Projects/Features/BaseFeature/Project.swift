import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "BaseFeature",
    product: .framework,
    dependencies: [
        .Core.DesignSystem,
        .Shared.Domain,
        .Shared.Utility,
        .Shared.FeatureThirdPartyLib
    ]
)
