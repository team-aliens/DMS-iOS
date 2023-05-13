import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.makeModule(
//     name: "DataMappingModule",
//     product: .framework
// )
let project = Project.makeModule(
    name: "DataMappingModule",
    product: .staticLibrary,
    targets: []
)
