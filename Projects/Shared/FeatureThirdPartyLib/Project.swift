import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "FeatureThirdPartyLib",
    product: .staticFramework,
    targets: [],
    externalDependencies: [
        .SPM.Needle,
        .SPM.Kingfisher
    ]
)
