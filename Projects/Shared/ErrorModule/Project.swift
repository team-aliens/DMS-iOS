import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.makeModule(
//     name: "ErrorModule",
//     product: .framework
// )
let project = Project.makeModule(
    name: "ErrorModule",
    product: .staticLibrary,
    targets: []
)
