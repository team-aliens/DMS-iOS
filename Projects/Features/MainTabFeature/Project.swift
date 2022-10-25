import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MainTabFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature
    ]
)