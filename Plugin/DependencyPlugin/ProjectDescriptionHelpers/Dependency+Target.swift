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
    static let ApplyFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.ApplyFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.ApplyFeature.rawValue)
    )
    static let ApplyFeature = TargetDependency.project(
        target: ModulePaths.Feature.ApplyFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.ApplyFeature.rawValue)
    )
    static let BaseFeature = TargetDependency.project(
        target: ModulePaths.Feature.BaseFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.BaseFeature.rawValue)
    )
    static let FindIDFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.FindIDFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.FindIDFeature.rawValue)
    )
    static let FindIDFeature = TargetDependency.project(
        target: ModulePaths.Feature.FindIDFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.FindIDFeature.rawValue)
    )
    static let HomeFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.HomeFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.HomeFeature.rawValue)
    )
    static let HomeFeature = TargetDependency.project(
        target: ModulePaths.Feature.HomeFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.HomeFeature.rawValue)
    )
    static let MainTabFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.MainTabFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.MainTabFeature.rawValue)
    )
    static let MainTabFeature = TargetDependency.project(
        target: ModulePaths.Feature.MainTabFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.MainTabFeature.rawValue)
    )
    static let MyPageFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.MyPageFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.MyPageFeature.rawValue)
    )
    static let MyPageFeature = TargetDependency.project(
        target: ModulePaths.Feature.MyPageFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.MyPageFeature.rawValue)
    )
    static let NoticeFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.NoticeFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.NoticeFeature.rawValue)
    )
    static let NoticeFeature = TargetDependency.project(
        target: ModulePaths.Feature.NoticeFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.NoticeFeature.rawValue)
    )
    static let OutingApplyFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.OutingApplyFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.OutingApplyFeature.rawValue)
    )
    static let OutingApplyFeature = TargetDependency.project(
        target: ModulePaths.Feature.OutingApplyFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.OutingApplyFeature.rawValue)
    )
    static let RemainApplyFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.RemainApplyFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.RemainApplyFeature.rawValue)
    )
    static let RemainApplyFeature = TargetDependency.project(
        target: ModulePaths.Feature.RemainApplyFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.RemainApplyFeature.rawValue)
    )
    static let RenewalPasswordFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.RenewalPasswordFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.RenewalPasswordFeature.rawValue)
    )
    static let RenewalPasswordFeature = TargetDependency.project(
        target: ModulePaths.Feature.RenewalPasswordFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.RenewalPasswordFeature.rawValue)
    )
    static let RootFeature = TargetDependency.project(
        target: ModulePaths.Feature.RootFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.RootFeature.rawValue)
    )
    static let SigninFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SigninFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SigninFeature.rawValue)
    )
    static let SigninFeature = TargetDependency.project(
        target: ModulePaths.Feature.SigninFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.SigninFeature.rawValue)
    )
    static let SignupFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SignupFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SignupFeature.rawValue)
    )
    static let SignupFeature = TargetDependency.project(
        target: ModulePaths.Feature.SignupFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.SignupFeature.rawValue)
    )
    static let SplashFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SplashFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SplashFeature.rawValue)
    )
    static let SplashFeature = TargetDependency.project(
        target: ModulePaths.Feature.SplashFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.SplashFeature.rawValue)
    )
    static let StudyRoomFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SplashFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SplashFeature.rawValue)
    )
    static let StudyRoomFeature = TargetDependency.project(
        target: ModulePaths.Feature.StudyRoomFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.StudyRoomFeature.rawValue)
    )
}

public extension TargetDependency.Domain {
    static let NotificationDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.NotificationDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.NotificationDomain.rawValue)
    )
    static let NotificationDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.NotificationDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.NotificationDomain.rawValue)
    )
    static let NotificationDomain = TargetDependency.project(
        target: ModulePaths.Domain.NotificationDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.NotificationDomain.rawValue)
    )
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
    static let OutingDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.OutingDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.OutingDomain.rawValue)
    )
    static let OutingDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.OutingDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.OutingDomain.rawValue)
    )
    static let OutingDomain = TargetDependency.project(
        target: ModulePaths.Domain.OutingDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.OutingDomain.rawValue)
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
    static let BaseDomain = TargetDependency.project(
        target: ModulePaths.Domain.BaseDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.BaseDomain.rawValue)
    )
    static let AuthDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.AuthDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.AuthDomain.rawValue)
    )
    static let AuthDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.AuthDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.AuthDomain.rawValue)
    )
    static let AuthDomain = TargetDependency.project(
        target: ModulePaths.Domain.AuthDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.AuthDomain.rawValue)
    )
}

public extension TargetDependency.Core {
    static let Keychain = TargetDependency.project(
        target: ModulePaths.Core.Keychain.targetName(type: .sources),
        path: .relativeToCore(ModulePaths.Core.Keychain.rawValue)
    )
}

public extension TargetDependency.Shared {
    static let DesignSystem = TargetDependency.project(
        target: ModulePaths.Shared.DesignSystem.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.DesignSystem.rawValue)
    )
    static let WatchDesignSystem = TargetDependency.project(
        target: ModulePaths.Shared.WatchDesignSystem.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.WatchDesignSystem.rawValue)
    )
    static let UtilityModule = TargetDependency.project(
        target: ModulePaths.Shared.UtilityModule.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.UtilityModule.rawValue)
    )
    static let GlobalThirdPartyLibrary = TargetDependency.project(
        target: ModulePaths.Shared.GlobalThirdPartyLibrary.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.GlobalThirdPartyLibrary.rawValue)
    )
    static let WatchRestAPIModule = TargetDependency.project(
        target: ModulePaths.Shared.WatchRestAPIModule.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.WatchRestAPIModule.rawValue)
    )
}
