import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ApplyFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature,
        .Feature.StudyRoomFeature,
        .Feature.RemainApplyFeature
    ]
)
