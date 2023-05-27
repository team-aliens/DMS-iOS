import ProjectDescription

// swiftlint: disable all
public extension TargetDependency {
    struct Feature {}
    struct Domain {}
    struct Core {}
    struct Shared {}
    struct UserInterfaces {}
}

public extension TargetDependency.Feature {
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
    static let UsersDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.UsersDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.UsersDomain.rawValue)
    )
    static let UsersDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.UsersDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.UsersDomain.rawValue)
    )
    static let UsersDomain = TargetDependency.project(
        target: ModulePaths.Domain.UsersDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.UsersDomain.rawValue)
    )
    static let StudyRoomsDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.StudyRoomsDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.StudyRoomsDomain.rawValue)
    )
    static let StudyRoomsDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.StudyRoomsDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.StudyRoomsDomain.rawValue)
    )
    static let StudyRoomsDomain = TargetDependency.project(
        target: ModulePaths.Domain.StudyRoomsDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.StudyRoomsDomain.rawValue)
    )
    static let StudentsDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.StudentsDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.StudentsDomain.rawValue)
    )
    static let StudentsDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.StudentsDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.StudentsDomain.rawValue)
    )
    static let StudentsDomain = TargetDependency.project(
        target: ModulePaths.Domain.StudentsDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.StudentsDomain.rawValue)
    )
    static let SchoolDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.SchoolDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.SchoolDomain.rawValue)
    )
    static let SchoolDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.SchoolDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.SchoolDomain.rawValue)
    )
    static let SchoolDomain = TargetDependency.project(
        target: ModulePaths.Domain.SchoolDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.SchoolDomain.rawValue)
    )
    static let RemainsDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.RemainsDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.RemainsDomain.rawValue)
    )
    static let RemainsDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.RemainsDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.RemainsDomain.rawValue)
    )
    static let RemainsDomain = TargetDependency.project(
        target: ModulePaths.Domain.RemainsDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.RemainsDomain.rawValue)
    )
    static let PointsDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.PointsDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.PointsDomain.rawValue)
    )
    static let PointsDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.PointsDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.PointsDomain.rawValue)
    )
    static let PointsDomain = TargetDependency.project(
        target: ModulePaths.Domain.PointsDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.PointsDomain.rawValue)
    )
    static let NoticeDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.NoticeDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.NoticeDomain.rawValue)
    )
    static let NoticeDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.NoticeDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.NoticeDomain.rawValue)
    )
    static let NoticeDomain = TargetDependency.project(
        target: ModulePaths.Domain.NoticeDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.NoticeDomain.rawValue)
    )
    static let MealDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.MealDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.MealDomain.rawValue)
    )
    static let MealDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.MealDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.MealDomain.rawValue)
    )
    static let MealDomain = TargetDependency.project(
        target: ModulePaths.Domain.MealDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.MealDomain.rawValue)
    )
    static let FilesDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.FilesDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.FilesDomain.rawValue)
    )
    static let FilesDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.FilesDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.FilesDomain.rawValue)
    )
    static let FilesDomain = TargetDependency.project(
        target: ModulePaths.Domain.FilesDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.FilesDomain.rawValue)
    )
    static let BaseDomain = TargetDependency.domain(name: "BaseDomain")
    static let AuthDomain = TargetDependency.domain(name: "AuthDomain")
}

public extension TargetDependency.Core {
    static let DesignSystem = TargetDependency.core(name: "DesignSystem")
    static let WatchDesignSystem = TargetDependency.core(name: "WatchDesignSystem")
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
    
    static let WatchRestAPIModule = TargetDependency.shared(name: "WatchRestAPIModule")
    static let DataMappingModule = TargetDependency.shared(name: "DataMappingModule")
    static let APIKit = TargetDependency.shared(name: "APIKit")
    static let Data = TargetDependency.shared(name: "DataModule")
    static let Domain = TargetDependency.shared(name: "DomainModule")
    static let DatabaseModule = TargetDependency.shared(name: "DatabaseModule")
    static let NetworkModule = TargetDependency.shared(name: "NetworkModule")
}
