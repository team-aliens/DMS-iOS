import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MyPageFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.StudentsDomainInterface,
        .Domain.AuthDomainInterface
    ]
)
