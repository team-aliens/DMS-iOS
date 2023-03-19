

import ApplyFeature
import BaseFeature
import DataModule
import DatabaseModule
import DesignSystem
import DomainModule
import FindIDFeature
import HomeFeature
import KeychainModule
import MainTabFeature
import MyPageFeature
import NeedleFoundation
import NetworkModule
import NoticeFeature
import RemainApplyFeature
import RenewalPasswordFeature
import RootFeature
import SigninFeature
import SignupFeature
import SplashFeature
import StudyRoomFeature
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SplashDependencye0cb7136f2ec3edfd60aProvider: SplashDependency {
    var reissueTokenUseCase: any ReissueTokenUseCase {
        return appComponent.reissueTokenUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider(appComponent: parent1(component) as! AppComponent)
}
private class SchoolConfirmationQuestionsDependency3fa2ccd12da7c7f5cfc1Provider: SchoolConfirmationQuestionsDependency {
    var checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase {
        return appComponent.checkSchoolQuestionUseCase
    }
    var fetchSchoolQuestionUseCase: any FetchSchoolQuestionUseCase {
        return appComponent.fetchSchoolQuestionUseCase
    }
    var signupEmailVerifyComponent: SignupEmailVerifyComponent {
        return appComponent.signupEmailVerifyComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SchoolConfirmationQuestionsComponent
private func factoryd462667f0418a53210fcf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SchoolConfirmationQuestionsDependency3fa2ccd12da7c7f5cfc1Provider(appComponent: parent1(component) as! AppComponent)
}
private class SchoolCodeDependencyc0114744c1c8c7843672Provider: SchoolCodeDependency {
    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase {
        return appComponent.checkSchoolCodeUseCase
    }
    var schoolConfirmationQuestionsComponent: SchoolConfirmationQuestionsComponent {
        return appComponent.schoolConfirmationQuestionsComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SchoolCodeComponent
private func factoryb65c1efbf06b87162473f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SchoolCodeDependencyc0114744c1c8c7843672Provider(appComponent: parent1(component) as! AppComponent)
}
private class IDSettingDependency8007dfdeec0db237b896Provider: IDSettingDependency {
    var checkExistGradeClassNumberUseCase: any CheckExistGradeClassNumberUseCase {
        return appComponent.checkExistGradeClassNumberUseCase
    }
    var checkDuplicateAccountIDUseCase: any CheckDuplicateAccountIDUseCase {
        return appComponent.checkDuplicateAccountIDUseCase
    }
    var signupPasswordComponent: SignupPasswordComponent {
        return appComponent.signupPasswordComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->IDSettingComponent
private func factory8b3573203ea51120dc5af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return IDSettingDependency8007dfdeec0db237b896Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignupPasswordDependency778bf5389a70d7df6152Provider: SignupPasswordDependency {
    var signupProfileImageComponent: SignupProfileImageComponent {
        return appComponent.signupProfileImageComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupPasswordComponent
private func factorye93d1d56840ff97c674af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupPasswordDependency778bf5389a70d7df6152Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignupEmailAuthCodeVerifyDependencyaf9da1ebf0e9e5f1b708Provider: SignupEmailAuthCodeVerifyDependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        return appComponent.sendAuthCodeUseCase
    }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        return appComponent.verifyAuthCodeUseCase
    }
    var idSettingComponent: IDSettingComponent {
        return appComponent.idSettingComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupEmailAuthCodeVerifyComponent
private func factoryb06be35aa893adde971bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupEmailAuthCodeVerifyDependencyaf9da1ebf0e9e5f1b708Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignupTermsDependency1c828944ed111a755519Provider: SignupTermsDependency {
    var signupUseCase: any SignupUseCase {
        return appComponent.signupUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupTermsComponent
private func factoryf84223c07d964abc9b0ef47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupTermsDependency1c828944ed111a755519Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignupEmailVerifyDependencyf9d372ac752ee19b78caProvider: SignupEmailVerifyDependency {
    var checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase {
        return appComponent.checkDuplicateEmailUseCase
    }
    var signupEmailAuthCodeVerifyComponent: SignupEmailAuthCodeVerifyComponent {
        return appComponent.signupEmailAuthCodeVerifyComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupEmailVerifyComponent
private func factory3b1904c76335d70151ebf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupEmailVerifyDependencyf9d372ac752ee19b78caProvider(appComponent: parent1(component) as! AppComponent)
}
private class SignupProfileImageDependency4203088ab57581d9f871Provider: SignupProfileImageDependency {
    var uploadFileUseCase: any UploadFileUseCase {
        return appComponent.uploadFileUseCase
    }
    var signupTermsComponent: SignupTermsComponent {
        return appComponent.signupTermsComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupProfileImageComponent
private func factory6792674212c15df7e9cff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupProfileImageDependency4203088ab57581d9f871Provider(appComponent: parent1(component) as! AppComponent)
}
private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency {
    var homeComponent: HomeComponent {
        return appComponent.homeComponent
    }
    var applyPageComponent: ApplyPageComponent {
        return appComponent.applyPageComponent
    }
    var noticeListComponent: NoticeListComponent {
        return appComponent.noticeListComponent
    }
    var myPageComponent: MyPageComponent {
        return appComponent.myPageComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider(appComponent: parent1(component) as! AppComponent)
}
private class MyPageDependency48d84b530313b3ee40feProvider: MyPageDependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase {
        return appComponent.fetchMyProfileUseCase
    }
    var logoutUseCase: any LogoutUseCase {
        return appComponent.logoutUseCase
    }
    var withdrawalUseCase: any WithdrawalUseCase {
        return appComponent.withdrawalUseCase
    }
    var changeProfileComponent: ChangeProfileComponent {
        return appComponent.changeProfileComponent
    }
    var rewardPointDetailComponent: RewardPointDetailComponent {
        return appComponent.rewardPointDetailComponent
    }
    var checkPasswordComponent: CheckPasswordComponent {
        return appComponent.checkPasswordComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MyPageComponent
private func factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MyPageDependency48d84b530313b3ee40feProvider(appComponent: parent1(component) as! AppComponent)
}
private class ModifyPasswordDependency8e8e0713c7893c69f342Provider: ModifyPasswordDependency {
    var changePasswordUseCase: any ChangePasswordUseCase {
        return appComponent.changePasswordUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ModifyPasswordComponent
private func factoryf1815b12945a9aa456a2f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ModifyPasswordDependency8e8e0713c7893c69f342Provider(appComponent: parent1(component) as! AppComponent)
}
private class RewardPointDetailDependency623f1251c3863ea3b233Provider: RewardPointDetailDependency {
    var fetchPointListUseCase: any FetchPointListUseCase {
        return appComponent.fetchPointListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RewardPointDetailComponent
private func factory87993268d9e212be8b1af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RewardPointDetailDependency623f1251c3863ea3b233Provider(appComponent: parent1(component) as! AppComponent)
}
private class ChangeProfileDependency18055275199967076a28Provider: ChangeProfileDependency {
    var changeProfileImageUseCase: any ChangeProfileImageUseCase {
        return appComponent.changeProfileImageUseCase
    }
    var uploadFileUseCase: any UploadFileUseCase {
        return appComponent.uploadFileUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ChangeProfileComponent
private func factory239204ef0c47c0c68c97f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ChangeProfileDependency18055275199967076a28Provider(appComponent: parent1(component) as! AppComponent)
}
private class CheckPasswordDependencyd8ff624643356835c570Provider: CheckPasswordDependency {
    var compareCurrentPasswordUseCase: any CompareCurrentPasswordUseCase {
        return appComponent.compareCurrentPasswordUseCase
    }
    var modifyPasswordComponent: ModifyPasswordComponent {
        return appComponent.modifyPasswordComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->CheckPasswordComponent
private func factorycb24ea072925f86bef40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CheckPasswordDependencyd8ff624643356835c570Provider(appComponent: parent1(component) as! AppComponent)
}
private class StudyRoomDetailDependency00589e4f8d1416a01b43Provider: StudyRoomDetailDependency {
    var fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase {
        return appComponent.fetchStudyAvailableTimeUseCase
    }
    var fetchSeatTypesUseCase: any FetchSeatTypesUseCase {
        return appComponent.fetchSeatTypesUseCase
    }
    var fetchDetailStudyRoomUseCase: any FetchDetailStudyRoomUseCase {
        return appComponent.fetchDetailStudyRoomUseCase
    }
    var applyStudyRoomSeatUseCase: any ApplyStudyRoomSeatUseCase {
        return appComponent.applyStudyRoomSeatUseCase
    }
    var cancelStudyRoomSeatUseCase: any CancelStudyRoomSeatUseCase {
        return appComponent.cancelStudyRoomSeatUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->StudyRoomDetailComponent
private func factorya36f40c25dcb280bae0ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return StudyRoomDetailDependency00589e4f8d1416a01b43Provider(appComponent: parent1(component) as! AppComponent)
}
private class StudyRoomListDependencyef56e26c25d5de596604Provider: StudyRoomListDependency {
    var fetchStudyRoomListUseCase: any FetchStudyRoomListUseCase {
        return appComponent.fetchStudyRoomListUseCase
    }
    var fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase {
        return appComponent.fetchStudyAvailableTimeUseCase
    }
    var fetchStudyroomTimeListUseCase: any FetchStudyroomTimeListUseCase {
        return appComponent.fetchStudyroomTimeListUseCase
    }
    var studyRoomDetailComponent: StudyRoomDetailComponent {
        return appComponent.studyRoomDetailComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->StudyRoomListComponent
private func factory7451c5364e65ee2d46bbf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return StudyRoomListDependencyef56e26c25d5de596604Provider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var signinComponent: SigninComponent {
        return appComponent.signinComponent
    }
    var mainTabComponent: MainTabComponent {
        return appComponent.mainTabComponent
    }
    var splashComponent: SplashComponent {
        return appComponent.splashComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class SigninDependencyde06a9d0b22764487733Provider: SigninDependency {
    var signinUseCase: any SigninUseCase {
        return appComponent.signinUseCase
    }
    var schoolCodeComponent: SchoolCodeComponent {
        return appComponent.schoolCodeComponent
    }
    var findIDComponent: FindIDComponent {
        return appComponent.findIDComponent
    }
    var enterInformationComponent: EnterInformationComponent {
        return appComponent.enterInformationComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SigninComponent
private func factory2882a056d84a613debccf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SigninDependencyde06a9d0b22764487733Provider(appComponent: parent1(component) as! AppComponent)
}
private class HomeDependency443c4e1871277bd8432aProvider: HomeDependency {
    var fetchMealListUseCase: any FetchMealListUseCase {
        return appComponent.fetchMealListUseCase
    }
    var fetchWhetherNewNoticeUseCase: any FetchWhetherNewNoticeUseCase {
        return appComponent.fetchWhetherNewNoticeUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->HomeComponent
private func factory67229cdf0f755562b2b1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency443c4e1871277bd8432aProvider(appComponent: parent1(component) as! AppComponent)
}
private class ApplyPageDependency3fe4e7c221b14c86d427Provider: ApplyPageDependency {
    var studyRoomListComponent: StudyRoomListComponent {
        return appComponent.studyRoomListComponent
    }
    var remainApplyComponent: RemainApplyComponent {
        return appComponent.remainApplyComponent
    }
    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase {
        return appComponent.fetchMyRemainApplicationItemsUseCase
    }
    var fetchMyStudyRoomAppItemsUseCase: any FetchMyStudyRoomAppItemsUseCase {
        return appComponent.fetchMyStudyRoomAppItemsUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ApplyPageComponent
private func factory45f688c5d4c7f313fc8df47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ApplyPageDependency3fe4e7c221b14c86d427Provider(appComponent: parent1(component) as! AppComponent)
}
private class AuthenticationEmailDependency73189eb572618b10e0fbProvider: AuthenticationEmailDependency {
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        return appComponent.verifyAuthCodeUseCase
    }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        return appComponent.sendAuthCodeUseCase
    }
    var changePasswordComponent: ChangePasswordComponent {
        return appComponent.changePasswordComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AuthenticationEmailComponent
private func factory8798d0becd9d2870112af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthenticationEmailDependency73189eb572618b10e0fbProvider(appComponent: parent1(component) as! AppComponent)
}
private class ChangePasswordDependency04ab7ced24136c4fb27eProvider: ChangePasswordDependency {
    var renewalPasswordUseCase: any RenewalPasswordUseCase {
        return appComponent.renewalPasswordUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ChangePasswordComponent
private func factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ChangePasswordDependency04ab7ced24136c4fb27eProvider(appComponent: parent1(component) as! AppComponent)
}
private class EnterInformationDependency9204f24c784151f429ddProvider: EnterInformationDependency {
    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase {
        return appComponent.checkAccountIDIsExistUseCase
    }
    var authenticationEmailComponent: AuthenticationEmailComponent {
        return appComponent.authenticationEmailComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->EnterInformationComponent
private func factory359a960501e79e833f64f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EnterInformationDependency9204f24c784151f429ddProvider(appComponent: parent1(component) as! AppComponent)
}
private class RemainApplyDependency4d8caef674dc801cbb54Provider: RemainApplyDependency {
    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase {
        return appComponent.fetchMyRemainApplicationItemsUseCase
    }
    var fetchRemainApplicationListUseCase: any FetchRemainApplicationListUseCase {
        return appComponent.fetchRemainApplicationListUseCase
    }
    var fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase {
        return appComponent.fetchRemainsAvailableTimeUseCase
    }
    var remainingApplicationsChangesUseCase: any RemainingApplicationsChangesUseCase {
        return appComponent.remainingApplicationsChangesUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RemainApplyComponent
private func factory9615846346c92a2f8176f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RemainApplyDependency4d8caef674dc801cbb54Provider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeListDependency0e93eb53be8626c408e4Provider: NoticeListDependency {
    var fetchNoticeListUseCase: any FetchNoticeListUseCase {
        return appComponent.fetchNoticeListUseCase
    }
    var noticeDetailComponent: NoticeDetailComponent {
        return appComponent.noticeDetailComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NoticeListComponent
private func factorye14e687c08985bdffcd0f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeListDependency0e93eb53be8626c408e4Provider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeDetailDependency714af3aed40eaebda420Provider: NoticeDetailDependency {
    var fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase {
        return appComponent.fetchDetailNoticeUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NoticeDetailComponent
private func factory3db143c2f80d621d5a7ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeDetailDependency714af3aed40eaebda420Provider(appComponent: parent1(component) as! AppComponent)
}
private class FindIDDependencyb481fe947a844cc29913Provider: FindIDDependency {
    var findIDUseCase: any FindIDUseCase {
        return appComponent.findIDUseCase
    }
    var fetchSchoolListUseCase: any FetchSchoolListUseCase {
        return appComponent.fetchSchoolListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindIDComponent
private func factory8dd2f9e0b545ead35ecaf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindIDDependencyb481fe947a844cc29913Provider(appComponent: parent1(component) as! AppComponent)
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["keychain-any Keychain"] = { [unowned self] in self.keychain as Any }
        localTable["remoteStudyRoomsDataSource-any RemoteStudyRoomsDataSource"] = { [unowned self] in self.remoteStudyRoomsDataSource as Any }
        localTable["studyRoomsRepository-any StudyRoomsRepository"] = { [unowned self] in self.studyRoomsRepository as Any }
        localTable["fetchStudyAvailableTimeUseCase-any FetchStudyAvailableTimeUseCase"] = { [unowned self] in self.fetchStudyAvailableTimeUseCase as Any }
        localTable["fetchSeatTypesUseCase-any FetchSeatTypesUseCase"] = { [unowned self] in self.fetchSeatTypesUseCase as Any }
        localTable["fetchStudyRoomListUseCase-any FetchStudyRoomListUseCase"] = { [unowned self] in self.fetchStudyRoomListUseCase as Any }
        localTable["fetchDetailStudyRoomUseCase-any FetchDetailStudyRoomUseCase"] = { [unowned self] in self.fetchDetailStudyRoomUseCase as Any }
        localTable["applyStudyRoomSeatUseCase-any ApplyStudyRoomSeatUseCase"] = { [unowned self] in self.applyStudyRoomSeatUseCase as Any }
        localTable["cancelStudyRoomSeatUseCase-any CancelStudyRoomSeatUseCase"] = { [unowned self] in self.cancelStudyRoomSeatUseCase as Any }
        localTable["fetchMyStudyRoomAppItemsUseCase-any FetchMyStudyRoomAppItemsUseCase"] = { [unowned self] in self.fetchMyStudyRoomAppItemsUseCase as Any }
        localTable["fetchStudyroomTimeListUseCase-any FetchStudyroomTimeListUseCase"] = { [unowned self] in self.fetchStudyroomTimeListUseCase as Any }
        localTable["localAuthDataSource-any LocalAuthDataSource"] = { [unowned self] in self.localAuthDataSource as Any }
        localTable["remoteAuthDataSource-any RemoteAuthDataSource"] = { [unowned self] in self.remoteAuthDataSource as Any }
        localTable["authRepository-any AuthRepository"] = { [unowned self] in self.authRepository as Any }
        localTable["signinUseCase-any SigninUseCase"] = { [unowned self] in self.signinUseCase as Any }
        localTable["verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"] = { [unowned self] in self.verifyAuthCodeUseCase as Any }
        localTable["sendAuthCodeUseCase-any SendAuthCodeUseCase"] = { [unowned self] in self.sendAuthCodeUseCase as Any }
        localTable["reissueTokenUseCase-any ReissueTokenUseCase"] = { [unowned self] in self.reissueTokenUseCase as Any }
        localTable["checkEmailExistByAccountIDUseCase-any CheckEmailExistByAccountIDUseCase"] = { [unowned self] in self.checkEmailExistByAccountIDUseCase as Any }
        localTable["checkAccountIDIsExistUseCase-any CheckAccountIDIsExistUseCase"] = { [unowned self] in self.checkAccountIDIsExistUseCase as Any }
        localTable["logoutUseCase-any LogoutUseCase"] = { [unowned self] in self.logoutUseCase as Any }
        localTable["schoolCodeComponent-SchoolCodeComponent"] = { [unowned self] in self.schoolCodeComponent as Any }
        localTable["findIDComponent-FindIDComponent"] = { [unowned self] in self.findIDComponent as Any }
        localTable["signinComponent-SigninComponent"] = { [unowned self] in self.signinComponent as Any }
        localTable["splashComponent-SplashComponent"] = { [unowned self] in self.splashComponent as Any }
        localTable["schoolConfirmationQuestionsComponent-SchoolConfirmationQuestionsComponent"] = { [unowned self] in self.schoolConfirmationQuestionsComponent as Any }
        localTable["signupEmailVerifyComponent-SignupEmailVerifyComponent"] = { [unowned self] in self.signupEmailVerifyComponent as Any }
        localTable["signupEmailAuthCodeVerifyComponent-SignupEmailAuthCodeVerifyComponent"] = { [unowned self] in self.signupEmailAuthCodeVerifyComponent as Any }
        localTable["idSettingComponent-IDSettingComponent"] = { [unowned self] in self.idSettingComponent as Any }
        localTable["enterInformationComponent-EnterInformationComponent"] = { [unowned self] in self.enterInformationComponent as Any }
        localTable["authenticationEmailComponent-AuthenticationEmailComponent"] = { [unowned self] in self.authenticationEmailComponent as Any }
        localTable["changePasswordComponent-ChangePasswordComponent"] = { [unowned self] in self.changePasswordComponent as Any }
        localTable["signupProfileImageComponent-SignupProfileImageComponent"] = { [unowned self] in self.signupProfileImageComponent as Any }
        localTable["signupPasswordComponent-SignupPasswordComponent"] = { [unowned self] in self.signupPasswordComponent as Any }
        localTable["signupTermsComponent-SignupTermsComponent"] = { [unowned self] in self.signupTermsComponent as Any }
        localTable["mainTabComponent-MainTabComponent"] = { [unowned self] in self.mainTabComponent as Any }
        localTable["homeComponent-HomeComponent"] = { [unowned self] in self.homeComponent as Any }
        localTable["studyRoomDetailComponent-StudyRoomDetailComponent"] = { [unowned self] in self.studyRoomDetailComponent as Any }
        localTable["noticeListComponent-NoticeListComponent"] = { [unowned self] in self.noticeListComponent as Any }
        localTable["myPageComponent-MyPageComponent"] = { [unowned self] in self.myPageComponent as Any }
        localTable["changeProfileComponent-ChangeProfileComponent"] = { [unowned self] in self.changeProfileComponent as Any }
        localTable["noticeDetailComponent-NoticeDetailComponent"] = { [unowned self] in self.noticeDetailComponent as Any }
        localTable["rewardPointDetailComponent-RewardPointDetailComponent"] = { [unowned self] in self.rewardPointDetailComponent as Any }
        localTable["checkPasswordComponent-CheckPasswordComponent"] = { [unowned self] in self.checkPasswordComponent as Any }
        localTable["modifyPasswordComponent-ModifyPasswordComponent"] = { [unowned self] in self.modifyPasswordComponent as Any }
        localTable["studyRoomListComponent-StudyRoomListComponent"] = { [unowned self] in self.studyRoomListComponent as Any }
        localTable["applyPageComponent-ApplyPageComponent"] = { [unowned self] in self.applyPageComponent as Any }
        localTable["remainApplyComponent-RemainApplyComponent"] = { [unowned self] in self.remainApplyComponent as Any }
        localTable["remoteNoticeDataSource-any RemoteNoticeDataSource"] = { [unowned self] in self.remoteNoticeDataSource as Any }
        localTable["noticeRepository-any NoticeRepository"] = { [unowned self] in self.noticeRepository as Any }
        localTable["fetchWhetherNewNoticeUseCase-any FetchWhetherNewNoticeUseCase"] = { [unowned self] in self.fetchWhetherNewNoticeUseCase as Any }
        localTable["fetchNoticeListUseCase-any FetchNoticeListUseCase"] = { [unowned self] in self.fetchNoticeListUseCase as Any }
        localTable["fetchDetailNoticeUseCase-any FetchDetailNoticeUseCase"] = { [unowned self] in self.fetchDetailNoticeUseCase as Any }
        localTable["remoteStudentsDataSource-any RemoteStudentsDataSource"] = { [unowned self] in self.remoteStudentsDataSource as Any }
        localTable["studentsRepository-any StudentsRepository"] = { [unowned self] in self.studentsRepository as Any }
        localTable["signupUseCase-any SignupUseCase"] = { [unowned self] in self.signupUseCase as Any }
        localTable["checkDuplicateAccountIDUseCase-any CheckDuplicateAccountIDUseCase"] = { [unowned self] in self.checkDuplicateAccountIDUseCase as Any }
        localTable["checkDuplicateEmailUseCase-any CheckDuplicateEmailUseCase"] = { [unowned self] in self.checkDuplicateEmailUseCase as Any }
        localTable["renewalPasswordUseCase-any RenewalPasswordUseCase"] = { [unowned self] in self.renewalPasswordUseCase as Any }
        localTable["findIDUseCase-any FindIDUseCase"] = { [unowned self] in self.findIDUseCase as Any }
        localTable["checkExistGradeClassNumberUseCase-any CheckExistGradeClassNumberUseCase"] = { [unowned self] in self.checkExistGradeClassNumberUseCase as Any }
        localTable["fetchMyProfileUseCase-any FetchMyProfileUseCase"] = { [unowned self] in self.fetchMyProfileUseCase as Any }
        localTable["changeProfileImageUseCase-any ChangeProfileImageUseCase"] = { [unowned self] in self.changeProfileImageUseCase as Any }
        localTable["withdrawalUseCase-any WithdrawalUseCase"] = { [unowned self] in self.withdrawalUseCase as Any }
        localTable["remoteUsersDataSource-any RemoteUsersDataSource"] = { [unowned self] in self.remoteUsersDataSource as Any }
        localTable["usersRepository-any UsersRepository"] = { [unowned self] in self.usersRepository as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { [unowned self] in self.changePasswordUseCase as Any }
        localTable["compareCurrentPasswordUseCase-any CompareCurrentPasswordUseCase"] = { [unowned self] in self.compareCurrentPasswordUseCase as Any }
        localTable["remotePointsDataSource-any RemotePointsDataSource"] = { [unowned self] in self.remotePointsDataSource as Any }
        localTable["pointsRepository-any PointsRepository"] = { [unowned self] in self.pointsRepository as Any }
        localTable["fetchPointListUseCase-any FetchPointListUseCase"] = { [unowned self] in self.fetchPointListUseCase as Any }
        localTable["remoteMealDataSource-any RemoteMealDataSource"] = { [unowned self] in self.remoteMealDataSource as Any }
        localTable["mealRepository-any MealRepository"] = { [unowned self] in self.mealRepository as Any }
        localTable["fetchMealListUseCase-any FetchMealListUseCase"] = { [unowned self] in self.fetchMealListUseCase as Any }
        localTable["remoteFilesDataSource-any RemoteFilesDataSource"] = { [unowned self] in self.remoteFilesDataSource as Any }
        localTable["filesRepository-any FilesRepository"] = { [unowned self] in self.filesRepository as Any }
        localTable["uploadFileUseCase-any UploadFileUseCase"] = { [unowned self] in self.uploadFileUseCase as Any }
        localTable["remoteRemainsDataSource-any RemoteRemainsDataSource"] = { [unowned self] in self.remoteRemainsDataSource as Any }
        localTable["remainsRepository-any RemainsRepository"] = { [unowned self] in self.remainsRepository as Any }
        localTable["remainingApplicationsChangesUseCase-any RemainingApplicationsChangesUseCase"] = { [unowned self] in self.remainingApplicationsChangesUseCase as Any }
        localTable["fetchMyRemainApplicationItemsUseCase-any FetchMyRemainApplicationItemsUseCase"] = { [unowned self] in self.fetchMyRemainApplicationItemsUseCase as Any }
        localTable["fetchRemainApplicationListUseCase-any FetchRemainApplicationListUseCase"] = { [unowned self] in self.fetchRemainApplicationListUseCase as Any }
        localTable["fetchRemainsAvailableTimeUseCase-any FetchRemainsAvailableTimeUseCase"] = { [unowned self] in self.fetchRemainsAvailableTimeUseCase as Any }
        localTable["remoteSchoolDataSource-any RemoteSchoolDataSource"] = { [unowned self] in self.remoteSchoolDataSource as Any }
        localTable["schoolRepository-any SchoolRepository"] = { [unowned self] in self.schoolRepository as Any }
        localTable["fetchSchoolListUseCase-any FetchSchoolListUseCase"] = { [unowned self] in self.fetchSchoolListUseCase as Any }
        localTable["fetchSchoolQuestionUseCase-any FetchSchoolQuestionUseCase"] = { [unowned self] in self.fetchSchoolQuestionUseCase as Any }
        localTable["checkSchoolQuestionUseCase-any CheckSchoolQuestionUseCase"] = { [unowned self] in self.checkSchoolQuestionUseCase as Any }
        localTable["checkSchoolCodeUseCase-any CheckSchoolCodeUseCase"] = { [unowned self] in self.checkSchoolCodeUseCase as Any }
    }
}
extension SplashComponent: Registration {
    public func registerItems() {
        keyPathToName[\SplashDependency.reissueTokenUseCase] = "reissueTokenUseCase-any ReissueTokenUseCase"
    }
}
extension SchoolConfirmationQuestionsComponent: Registration {
    public func registerItems() {
        keyPathToName[\SchoolConfirmationQuestionsDependency.checkSchoolQuestionUseCase] = "checkSchoolQuestionUseCase-any CheckSchoolQuestionUseCase"
        keyPathToName[\SchoolConfirmationQuestionsDependency.fetchSchoolQuestionUseCase] = "fetchSchoolQuestionUseCase-any FetchSchoolQuestionUseCase"
        keyPathToName[\SchoolConfirmationQuestionsDependency.signupEmailVerifyComponent] = "signupEmailVerifyComponent-SignupEmailVerifyComponent"
    }
}
extension SchoolCodeComponent: Registration {
    public func registerItems() {
        keyPathToName[\SchoolCodeDependency.checkSchoolCodeUseCase] = "checkSchoolCodeUseCase-any CheckSchoolCodeUseCase"
        keyPathToName[\SchoolCodeDependency.schoolConfirmationQuestionsComponent] = "schoolConfirmationQuestionsComponent-SchoolConfirmationQuestionsComponent"
    }
}
extension IDSettingComponent: Registration {
    public func registerItems() {
        keyPathToName[\IDSettingDependency.checkExistGradeClassNumberUseCase] = "checkExistGradeClassNumberUseCase-any CheckExistGradeClassNumberUseCase"
        keyPathToName[\IDSettingDependency.checkDuplicateAccountIDUseCase] = "checkDuplicateAccountIDUseCase-any CheckDuplicateAccountIDUseCase"
        keyPathToName[\IDSettingDependency.signupPasswordComponent] = "signupPasswordComponent-SignupPasswordComponent"
    }
}
extension SignupPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupPasswordDependency.signupProfileImageComponent] = "signupProfileImageComponent-SignupProfileImageComponent"
    }
}
extension SignupEmailAuthCodeVerifyComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupEmailAuthCodeVerifyDependency.sendAuthCodeUseCase] = "sendAuthCodeUseCase-any SendAuthCodeUseCase"
        keyPathToName[\SignupEmailAuthCodeVerifyDependency.verifyAuthCodeUseCase] = "verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"
        keyPathToName[\SignupEmailAuthCodeVerifyDependency.idSettingComponent] = "idSettingComponent-IDSettingComponent"
    }
}
extension SignupTermsComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupTermsDependency.signupUseCase] = "signupUseCase-any SignupUseCase"
    }
}
extension SignupEmailVerifyComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupEmailVerifyDependency.checkDuplicateEmailUseCase] = "checkDuplicateEmailUseCase-any CheckDuplicateEmailUseCase"
        keyPathToName[\SignupEmailVerifyDependency.signupEmailAuthCodeVerifyComponent] = "signupEmailAuthCodeVerifyComponent-SignupEmailAuthCodeVerifyComponent"
    }
}
extension SignupProfileImageComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupProfileImageDependency.uploadFileUseCase] = "uploadFileUseCase-any UploadFileUseCase"
        keyPathToName[\SignupProfileImageDependency.signupTermsComponent] = "signupTermsComponent-SignupTermsComponent"
    }
}
extension MainTabComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainTabDependency.homeComponent] = "homeComponent-HomeComponent"
        keyPathToName[\MainTabDependency.applyPageComponent] = "applyPageComponent-ApplyPageComponent"
        keyPathToName[\MainTabDependency.noticeListComponent] = "noticeListComponent-NoticeListComponent"
        keyPathToName[\MainTabDependency.myPageComponent] = "myPageComponent-MyPageComponent"
    }
}
extension MyPageComponent: Registration {
    public func registerItems() {
        keyPathToName[\MyPageDependency.fetchMyProfileUseCase] = "fetchMyProfileUseCase-any FetchMyProfileUseCase"
        keyPathToName[\MyPageDependency.logoutUseCase] = "logoutUseCase-any LogoutUseCase"
        keyPathToName[\MyPageDependency.withdrawalUseCase] = "withdrawalUseCase-any WithdrawalUseCase"
        keyPathToName[\MyPageDependency.changeProfileComponent] = "changeProfileComponent-ChangeProfileComponent"
        keyPathToName[\MyPageDependency.rewardPointDetailComponent] = "rewardPointDetailComponent-RewardPointDetailComponent"
        keyPathToName[\MyPageDependency.checkPasswordComponent] = "checkPasswordComponent-CheckPasswordComponent"
    }
}
extension ModifyPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\ModifyPasswordDependency.changePasswordUseCase] = "changePasswordUseCase-any ChangePasswordUseCase"
    }
}
extension RewardPointDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\RewardPointDetailDependency.fetchPointListUseCase] = "fetchPointListUseCase-any FetchPointListUseCase"
    }
}
extension ChangeProfileComponent: Registration {
    public func registerItems() {
        keyPathToName[\ChangeProfileDependency.changeProfileImageUseCase] = "changeProfileImageUseCase-any ChangeProfileImageUseCase"
        keyPathToName[\ChangeProfileDependency.uploadFileUseCase] = "uploadFileUseCase-any UploadFileUseCase"
    }
}
extension CheckPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\CheckPasswordDependency.compareCurrentPasswordUseCase] = "compareCurrentPasswordUseCase-any CompareCurrentPasswordUseCase"
        keyPathToName[\CheckPasswordDependency.modifyPasswordComponent] = "modifyPasswordComponent-ModifyPasswordComponent"
    }
}
extension StudyRoomDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudyRoomDetailDependency.fetchStudyAvailableTimeUseCase] = "fetchStudyAvailableTimeUseCase-any FetchStudyAvailableTimeUseCase"
        keyPathToName[\StudyRoomDetailDependency.fetchSeatTypesUseCase] = "fetchSeatTypesUseCase-any FetchSeatTypesUseCase"
        keyPathToName[\StudyRoomDetailDependency.fetchDetailStudyRoomUseCase] = "fetchDetailStudyRoomUseCase-any FetchDetailStudyRoomUseCase"
        keyPathToName[\StudyRoomDetailDependency.applyStudyRoomSeatUseCase] = "applyStudyRoomSeatUseCase-any ApplyStudyRoomSeatUseCase"
        keyPathToName[\StudyRoomDetailDependency.cancelStudyRoomSeatUseCase] = "cancelStudyRoomSeatUseCase-any CancelStudyRoomSeatUseCase"
    }
}
extension StudyRoomListComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudyRoomListDependency.fetchStudyRoomListUseCase] = "fetchStudyRoomListUseCase-any FetchStudyRoomListUseCase"
        keyPathToName[\StudyRoomListDependency.fetchStudyAvailableTimeUseCase] = "fetchStudyAvailableTimeUseCase-any FetchStudyAvailableTimeUseCase"
        keyPathToName[\StudyRoomListDependency.fetchStudyroomTimeListUseCase] = "fetchStudyroomTimeListUseCase-any FetchStudyroomTimeListUseCase"
        keyPathToName[\StudyRoomListDependency.studyRoomDetailComponent] = "studyRoomDetailComponent-StudyRoomDetailComponent"
    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.signinComponent] = "signinComponent-SigninComponent"
        keyPathToName[\RootDependency.mainTabComponent] = "mainTabComponent-MainTabComponent"
        keyPathToName[\RootDependency.splashComponent] = "splashComponent-SplashComponent"
    }
}
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.signinUseCase] = "signinUseCase-any SigninUseCase"
        keyPathToName[\SigninDependency.schoolCodeComponent] = "schoolCodeComponent-SchoolCodeComponent"
        keyPathToName[\SigninDependency.findIDComponent] = "findIDComponent-FindIDComponent"
        keyPathToName[\SigninDependency.enterInformationComponent] = "enterInformationComponent-EnterInformationComponent"
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.fetchMealListUseCase] = "fetchMealListUseCase-any FetchMealListUseCase"
        keyPathToName[\HomeDependency.fetchWhetherNewNoticeUseCase] = "fetchWhetherNewNoticeUseCase-any FetchWhetherNewNoticeUseCase"
    }
}
extension ApplyPageComponent: Registration {
    public func registerItems() {
        keyPathToName[\ApplyPageDependency.studyRoomListComponent] = "studyRoomListComponent-StudyRoomListComponent"
        keyPathToName[\ApplyPageDependency.remainApplyComponent] = "remainApplyComponent-RemainApplyComponent"
        keyPathToName[\ApplyPageDependency.fetchMyRemainApplicationItemsUseCase] = "fetchMyRemainApplicationItemsUseCase-any FetchMyRemainApplicationItemsUseCase"
        keyPathToName[\ApplyPageDependency.fetchMyStudyRoomAppItemsUseCase] = "fetchMyStudyRoomAppItemsUseCase-any FetchMyStudyRoomAppItemsUseCase"
    }
}
extension AuthenticationEmailComponent: Registration {
    public func registerItems() {
        keyPathToName[\AuthenticationEmailDependency.verifyAuthCodeUseCase] = "verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"
        keyPathToName[\AuthenticationEmailDependency.sendAuthCodeUseCase] = "sendAuthCodeUseCase-any SendAuthCodeUseCase"
        keyPathToName[\AuthenticationEmailDependency.changePasswordComponent] = "changePasswordComponent-ChangePasswordComponent"
    }
}
extension ChangePasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\ChangePasswordDependency.renewalPasswordUseCase] = "renewalPasswordUseCase-any RenewalPasswordUseCase"
    }
}
extension EnterInformationComponent: Registration {
    public func registerItems() {
        keyPathToName[\EnterInformationDependency.checkAccountIDIsExistUseCase] = "checkAccountIDIsExistUseCase-any CheckAccountIDIsExistUseCase"
        keyPathToName[\EnterInformationDependency.authenticationEmailComponent] = "authenticationEmailComponent-AuthenticationEmailComponent"
    }
}
extension RemainApplyComponent: Registration {
    public func registerItems() {
        keyPathToName[\RemainApplyDependency.fetchMyRemainApplicationItemsUseCase] = "fetchMyRemainApplicationItemsUseCase-any FetchMyRemainApplicationItemsUseCase"
        keyPathToName[\RemainApplyDependency.fetchRemainApplicationListUseCase] = "fetchRemainApplicationListUseCase-any FetchRemainApplicationListUseCase"
        keyPathToName[\RemainApplyDependency.fetchRemainsAvailableTimeUseCase] = "fetchRemainsAvailableTimeUseCase-any FetchRemainsAvailableTimeUseCase"
        keyPathToName[\RemainApplyDependency.remainingApplicationsChangesUseCase] = "remainingApplicationsChangesUseCase-any RemainingApplicationsChangesUseCase"
    }
}
extension NoticeListComponent: Registration {
    public func registerItems() {
        keyPathToName[\NoticeListDependency.fetchNoticeListUseCase] = "fetchNoticeListUseCase-any FetchNoticeListUseCase"
        keyPathToName[\NoticeListDependency.noticeDetailComponent] = "noticeDetailComponent-NoticeDetailComponent"
    }
}
extension NoticeDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\NoticeDetailDependency.fetchDetailNoticeUseCase] = "fetchDetailNoticeUseCase-any FetchDetailNoticeUseCase"
    }
}
extension FindIDComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindIDDependency.findIDUseCase] = "findIDUseCase-any FindIDUseCase"
        keyPathToName[\FindIDDependency.fetchSchoolListUseCase] = "fetchSchoolListUseCase-any FetchSchoolListUseCase"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->SplashComponent", factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SchoolConfirmationQuestionsComponent", factoryd462667f0418a53210fcf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SchoolCodeComponent", factoryb65c1efbf06b87162473f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->IDSettingComponent", factory8b3573203ea51120dc5af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupPasswordComponent", factorye93d1d56840ff97c674af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupEmailAuthCodeVerifyComponent", factoryb06be35aa893adde971bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupTermsComponent", factoryf84223c07d964abc9b0ef47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupEmailVerifyComponent", factory3b1904c76335d70151ebf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupProfileImageComponent", factory6792674212c15df7e9cff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MyPageComponent", factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ModifyPasswordComponent", factoryf1815b12945a9aa456a2f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RewardPointDetailComponent", factory87993268d9e212be8b1af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ChangeProfileComponent", factory239204ef0c47c0c68c97f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->CheckPasswordComponent", factorycb24ea072925f86bef40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->StudyRoomDetailComponent", factorya36f40c25dcb280bae0ff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->StudyRoomListComponent", factory7451c5364e65ee2d46bbf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ApplyPageComponent", factory45f688c5d4c7f313fc8df47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AuthenticationEmailComponent", factory8798d0becd9d2870112af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ChangePasswordComponent", factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EnterInformationComponent", factory359a960501e79e833f64f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RemainApplyComponent", factory9615846346c92a2f8176f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeListComponent", factorye14e687c08985bdffcd0f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeDetailComponent", factory3db143c2f80d621d5a7ff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindIDComponent", factory8dd2f9e0b545ead35ecaf47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
