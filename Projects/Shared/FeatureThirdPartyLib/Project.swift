import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "FeatureThirdPartyLib",
    product: .framework,
    dependencies: [
        .SPM.Needle,
        .SPM.Kingfisher
    ]
)
