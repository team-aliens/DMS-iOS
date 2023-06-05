import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "StudyRoomFeature",
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.StudyRoomsDomainInterface
    ]
)
