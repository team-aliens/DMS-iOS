import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

//let project = Project.makeModule(
//    name: "FeatureThirdPartyLib",
//    product: .framework,
//    dependencies: [
//        .SPM.Needle,
//        .SPM.Kingfisher
//    ]
//)
let project = Project.makeModule(
    name: "FeatureThirdPartyLib",
    product: .framework,
    targets: [],
    externalDependencies: [
        .SPM.Needle,
        .SPM.Kingfisher
    ]
)
