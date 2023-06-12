import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    product: .framework,
    targets: [.unitTest],
    externalDependencies: [
        .SPM.Moya,
        .SPM.CombineMoya
    ],
    internalDependencies: [
        .Shared.GlobalThirdPartyLibrary,
        .Shared.UtilityModule,
        .Core.Keychain
    ],
    additionalPlistRows: [
        "BASE_URL": .string("$(BASE_URL)")
    ]
)
