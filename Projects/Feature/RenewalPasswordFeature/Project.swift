import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "RenewalPasswordFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
