import ProjectDescription

// swiftlint: disable all
public extension TargetDependency {
    struct Feature {}
    struct Domain {}
    struct Core {}
    struct Shared {}
    struct Module {}
    struct Service {}
    struct UserInterfaces {}
}

public extension TargetDependency.Feature {
//    static let BaseFeature = TargetDependency.project(
//        target: ModulePaths.Feature.BaseFeature.targetName(type: .sources),
//        path: .relativeToFeature(ModulePaths.Feature.BaseFeature.rawValue)
//    )
    static let RemainApplyFeature = TargetDependency.feature(name: "RemainApplyFeature")
    static let StudyRoomFeature = TargetDependency.feature(name: "StudyRoomFeature")
    static let SplashFeature = TargetDependency.feature(name: "SplashFeature")
    static let MyPageFeature = TargetDependency.feature(name: "MyPageFeature")
    static let NoticeFeature = TargetDependency.feature(name: "NoticeFeature")
    static let ApplyFeature = TargetDependency.feature(name: "ApplyFeature")
    static let SignupFeature = TargetDependency.feature(name: "SignupFeature")
    static let HomeFeature = TargetDependency.feature(name: "HomeFeature")
    static let RenewalPasswordFeature = TargetDependency.feature(name: "RenewalPasswordFeature")
    static let MainTabFeature = TargetDependency.feature(name: "MainTabFeature")
    static let FindIDFeature = TargetDependency.feature(name: "FindIDFeature")
    static let SigninFeature = TargetDependency.feature(name: "SigninFeature")
    static let BaseFeature = TargetDependency.feature(name: "BaseFeature")
    static let RootFeature = TargetDependency.feature(name: "RootFeature")
}

public extension TargetDependency.Domain {
    static let BaseDomain = TargetDependency.project(
        target: ModulePaths.Domain.BaseDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.BaseDomain.rawValue)
    )
}

public extension TargetDependency.Core {
//    static let DesignSystem = TargetDependency.project(
//        target: ModulePaths.Core.DesignSystem.targetName(type: .sources),
//        path: .relativeToCore(ModulePaths.Core.DesignSystem.rawValue)
//    )
    static let DesignSystem = TargetDependency.shared(name: "DesignSystem")
    static let WatchDesignSystem = TargetDependency.shared(name: "WatchDesignSystem")
}

public extension TargetDependency.Shared {
    static let UtilityModule = TargetDependency.project(
        target: ModulePaths.Shared.UtilityModule.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.UtilityModule.rawValue)
    )
    static let GlobalThirdPartyLibrary = TargetDependency.project(
        target: ModulePaths.Shared.GlobalThirdPartyLibrary.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.GlobalThirdPartyLibrary.rawValue)
    )
    static let KeychainModule = TargetDependency.shared(name: "KeychainModule")
    static let ErrorModule = TargetDependency.shared(name: "ErrorModule")
    static let FeatureThirdPartyLib = TargetDependency.shared(name: "FeatureThirdPartyLib")
    static let ThirdPartyLib = TargetDependency.shared(name: "ThirdPartyLib")
    static let Utility = TargetDependency.shared(name: "Utility")
    
    static let WatchRestAPIModule = TargetDependency.shared(name: "WatchRestAPIModule")
    static let DataMappingModule = TargetDependency.shared(name: "DataMappingModule")
    static let APIKit = TargetDependency.shared(name: "APIKit")
    static let Data = TargetDependency.shared(name: "DataModule")
    static let Domain = TargetDependency.shared(name: "DomainModule")
    static let DatabaseModule = TargetDependency.shared(name: "DatabaseModule")
    static let NetworkModule = TargetDependency.shared(name: "NetworkModule")
}
