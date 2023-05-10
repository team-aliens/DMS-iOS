import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

//let project = Project.makeModule(
//    name: "ThirdPartyLib",
//    product: .framework,
//    dependencies: [
//    ]
//)
let project = Project.makeModule(
    name: "ThirdPartyLib",
    product: .framework,
    targets: [.unitTest]
)
