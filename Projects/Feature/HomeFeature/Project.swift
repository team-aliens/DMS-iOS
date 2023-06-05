import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "HomeFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.MealDomainInterface,
        .Domain.NoticeDomainInterface
    ]
)
