import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "SigninFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature,
        .Feature.SignupFeature,
        .Feature.FindIDFeature,
        .Feature.RenewalPasswordFeature
    ],
    testDependencies: [
        .Shared.Data
    ]
)
