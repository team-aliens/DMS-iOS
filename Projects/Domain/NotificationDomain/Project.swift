import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.NotificationDomain.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest],
    internalDependencies: [
        .Domain.BaseDomain
    ]
)
