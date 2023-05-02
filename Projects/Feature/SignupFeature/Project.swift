import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "SignupFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature
    ],
    testDependencies: [
        .Shared.Data
    ]
)
