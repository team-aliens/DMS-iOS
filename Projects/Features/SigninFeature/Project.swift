import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "SigninFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature,
        .Project.Features.SignupFeature,
        .Project.Features.FindIDFeature,
        .Project.Features.RenewalPasswordFeature
    ],
    testDependencies: [
        .Project.Service.Data
    ]
)
