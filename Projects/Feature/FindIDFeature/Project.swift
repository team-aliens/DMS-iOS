import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "FindIDFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.StudentsDomainInterface,
        .Domain.SchoolDomainInterface
    ]
)
