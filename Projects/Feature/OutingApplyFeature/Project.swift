import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "OutingApplyFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.OutingDomainInterface
    ]
)
