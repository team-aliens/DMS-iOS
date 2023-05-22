import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "BaseFeature",
    product: .framework,
    targets: [.unitTest],
    internalDependencies: [
        .Core.DesignSystem,
        .Shared.Domain,
        .Shared.FeatureThirdPartyLib,
        .Shared.Utility
    ]
)
