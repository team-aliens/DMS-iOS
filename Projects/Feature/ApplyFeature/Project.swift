import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ApplyFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.StudyRoomFeatureInterface,
        .Feature.RemainApplyFeatureInterface,
        .Domain.StudyRoomsDomainInterface,
        .Domain.RemainsDomainInterface
    ]
)
