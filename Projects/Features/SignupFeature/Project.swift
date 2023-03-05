import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "SignupFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature,
        .Project.Module.WebCredentialsManager
    ]
)
