import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "SigninFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.SignupFeature,
        .Feature.FindIDFeature,
        .Feature.RenewalPasswordFeature
    ],
    unitTestDependencies: [
        .Shared.Data
    ]
)
