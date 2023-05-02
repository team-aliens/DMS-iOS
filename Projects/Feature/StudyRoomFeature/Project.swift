import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "StudyRoomFeature",
    product: .staticFramework,
    dependencies: [
        .Feature.BaseFeature
    ])
