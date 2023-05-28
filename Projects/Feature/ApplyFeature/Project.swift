import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ApplyFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.StudyRoomFeature,
        .Feature.RemainApplyFeature,
        .Domain.StudyRoomsDomainInterface,
        .Domain.RemainsDomainInterface
    ]
)
