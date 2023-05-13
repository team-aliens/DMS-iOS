import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.makeModule(
//     name: "KeychainModule",
//     product: .staticFramework
// )
let project = Project.makeModule(
    name: "KeychainModule",
    product: .staticLibrary,
    targets: [.unitTest]
)
