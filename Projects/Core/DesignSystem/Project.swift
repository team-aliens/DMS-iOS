import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "DesignSystem",
    product: .framework,
    targets: [],
    internalDependencies: [],
    resources: ["Resources/**"]
)
