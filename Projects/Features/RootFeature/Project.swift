import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "RootFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature,
        .Project.Features.SignupFeature,
        .Project.Features.FindIDFeature,
        .Project.Features.RenewalPasswordFeature,
        .Project.Features.SigninFeature,
        .Project.Features.MainTabFeature
    ]
)
