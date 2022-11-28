

import ApplyFeature
import BaseFeature
import DataModule
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
import RenewalPasswordFeature
import RootFeature
import SigninFeature
import SignupFeature
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

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
    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase {
        return appComponent.checkAccountIDIsExistUseCase
    }
    var checkExistGradeClassNumberUseCase: any CheckExistGradeClassNumberUseCase {
        return appComponent.checkExistGradeClassNumberUseCase
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
    var applyComponent: ApplyComponent {
        return appComponent.applyComponent
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
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var signinComponent: SigninComponent {
        return appComponent.signinComponent
    }
    var mainTabComponent: MainTabComponent {
        return appComponent.mainTabComponent
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
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->HomeComponent
private func factory67229cdf0f755562b2b1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency443c4e1871277bd8432aProvider(appComponent: parent1(component) as! AppComponent)
}
private class ApplyDependency468ec8d97f04fe0ebd10Provider: ApplyDependency {


    init() {

    }
}
/// ^->AppComponent->ApplyComponent
private func factory3cbfeafbe8b73941b232e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ApplyDependency468ec8d97f04fe0ebd10Provider()
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

        localTable["keychain-any Keychain"] = { self.keychain as Any }
        localTable["remoteAuthDataSource-any RemoteAuthDataSource"] = { self.remoteAuthDataSource as Any }
        localTable["authRepository-any AuthRepository"] = { self.authRepository as Any }
        localTable["signinUseCase-any SigninUseCase"] = { self.signinUseCase as Any }
        localTable["verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"] = { self.verifyAuthCodeUseCase as Any }
        localTable["sendAuthCodeUseCase-any SendAuthCodeUseCase"] = { self.sendAuthCodeUseCase as Any }
        localTable["reissueTokenUseCase-any ReissueTokenUseCase"] = { self.reissueTokenUseCase as Any }
        localTable["checkEmailExistByAccountIDUseCase-any CheckEmailExistByAccountIDUseCase"] = { self.checkEmailExistByAccountIDUseCase as Any }
        localTable["checkAccountIDIsExistUseCase-any CheckAccountIDIsExistUseCase"] = { self.checkAccountIDIsExistUseCase as Any }
        localTable["schoolCodeComponent-SchoolCodeComponent"] = { self.schoolCodeComponent as Any }
        localTable["findIDComponent-FindIDComponent"] = { self.findIDComponent as Any }
        localTable["signinComponent-SigninComponent"] = { self.signinComponent as Any }
        localTable["schoolConfirmationQuestionsComponent-SchoolConfirmationQuestionsComponent"] = { self.schoolConfirmationQuestionsComponent as Any }
        localTable["signupEmailVerifyComponent-SignupEmailVerifyComponent"] = { self.signupEmailVerifyComponent as Any }
        localTable["signupEmailAuthCodeVerifyComponent-SignupEmailAuthCodeVerifyComponent"] = { self.signupEmailAuthCodeVerifyComponent as Any }
        localTable["idSettingComponent-IDSettingComponent"] = { self.idSettingComponent as Any }
        localTable["enterInformationComponent-EnterInformationComponent"] = { self.enterInformationComponent as Any }
        localTable["authenticationEmailComponent-AuthenticationEmailComponent"] = { self.authenticationEmailComponent as Any }
        localTable["changePasswordComponent-ChangePasswordComponent"] = { self.changePasswordComponent as Any }
        localTable["signupProfileImageComponent-SignupProfileImageComponent"] = { self.signupProfileImageComponent as Any }
        localTable["signupPasswordComponent-SignupPasswordComponent"] = { self.signupPasswordComponent as Any }
        localTable["signupTermsComponent-SignupTermsComponent"] = { self.signupTermsComponent as Any }
        localTable["mainTabComponent-MainTabComponent"] = { self.mainTabComponent as Any }
        localTable["homeComponent-HomeComponent"] = { self.homeComponent as Any }
        localTable["applyComponent-ApplyComponent"] = { self.applyComponent as Any }
        localTable["noticeListComponent-NoticeListComponent"] = { self.noticeListComponent as Any }
        localTable["myPageComponent-MyPageComponent"] = { self.myPageComponent as Any }
        localTable["changeProfileComponent-ChangeProfileComponent"] = { self.changeProfileComponent as Any }
        localTable["noticeDetailComponent-NoticeDetailComponent"] = { self.noticeDetailComponent as Any }
        localTable["rewardPointDetailComponent-RewardPointDetailComponent"] = { self.rewardPointDetailComponent as Any }
        localTable["checkPasswordComponent-CheckPasswordComponent"] = { self.checkPasswordComponent as Any }
        localTable["modifyPasswordComponent-ModifyPasswordComponent"] = { self.modifyPasswordComponent as Any }
        localTable["remoteNoticeDataSource-any RemoteNoticeDataSource"] = { self.remoteNoticeDataSource as Any }
        localTable["noticeRepository-any NoticeRepository"] = { self.noticeRepository as Any }
        localTable["fetchWhetherNewNoticeUseCase-any FetchWhetherNewNoticeUseCase"] = { self.fetchWhetherNewNoticeUseCase as Any }
        localTable["fetchNoticeListUseCase-any FetchNoticeListUseCase"] = { self.fetchNoticeListUseCase as Any }
        localTable["fetchDetailNoticeUseCase-any FetchDetailNoticeUseCase"] = { self.fetchDetailNoticeUseCase as Any }
        localTable["remoteStudentsDataSource-any RemoteStudentsDataSource"] = { self.remoteStudentsDataSource as Any }
        localTable["studentsRepository-any StudentsRepository"] = { self.studentsRepository as Any }
        localTable["signupUseCase-any SignupUseCase"] = { self.signupUseCase as Any }
        localTable["checkDuplicateAccountIDUseCase-any CheckDuplicateAccountIDUseCase"] = { self.checkDuplicateAccountIDUseCase as Any }
        localTable["checkDuplicateEmailUseCase-any CheckDuplicateEmailUseCase"] = { self.checkDuplicateEmailUseCase as Any }
        localTable["renewalPasswordUseCase-any RenewalPasswordUseCase"] = { self.renewalPasswordUseCase as Any }
        localTable["findIDUseCase-any FindIDUseCase"] = { self.findIDUseCase as Any }
        localTable["checkExistGradeClassNumberUseCase-any CheckExistGradeClassNumberUseCase"] = { self.checkExistGradeClassNumberUseCase as Any }
        localTable["fetchMyProfileUseCase-any FetchMyProfileUseCase"] = { self.fetchMyProfileUseCase as Any }
        localTable["changeProfileImageUseCase-any ChangeProfileImageUseCase"] = { self.changeProfileImageUseCase as Any }
        localTable["remoteUsersDataSource-any RemoteUsersDataSource"] = { self.remoteUsersDataSource as Any }
        localTable["usersRepository-any UsersRepository"] = { self.usersRepository as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { self.changePasswordUseCase as Any }
        localTable["compareCurrentPasswordUseCase-any CompareCurrentPasswordUseCase"] = { self.compareCurrentPasswordUseCase as Any }
        localTable["remotePointsDataSource-any RemotePointsDataSource"] = { self.remotePointsDataSource as Any }
        localTable["pointsRepository-any PointsRepository"] = { self.pointsRepository as Any }
        localTable["fetchPointListUseCase-any FetchPointListUseCase"] = { self.fetchPointListUseCase as Any }
        localTable["remoteMealDataSource-any RemoteMealDataSource"] = { self.remoteMealDataSource as Any }
        localTable["mealRepository-any MealRepository"] = { self.mealRepository as Any }
        localTable["fetchMealListUseCase-any FetchMealListUseCase"] = { self.fetchMealListUseCase as Any }
        localTable["remoteFilesDataSource-any RemoteFilesDataSource"] = { self.remoteFilesDataSource as Any }
        localTable["filesRepository-any FilesRepository"] = { self.filesRepository as Any }
        localTable["uploadFileUseCase-any UploadFileUseCase"] = { self.uploadFileUseCase as Any }
        localTable["remoteSchoolDataSource-any RemoteSchoolDataSource"] = { self.remoteSchoolDataSource as Any }
        localTable["schoolRepository-any SchoolRepository"] = { self.schoolRepository as Any }
        localTable["fetchSchoolListUseCase-any FetchSchoolListUseCase"] = { self.fetchSchoolListUseCase as Any }
        localTable["fetchSchoolQuestionUseCase-any FetchSchoolQuestionUseCase"] = { self.fetchSchoolQuestionUseCase as Any }
        localTable["checkSchoolQuestionUseCase-any CheckSchoolQuestionUseCase"] = { self.checkSchoolQuestionUseCase as Any }
        localTable["checkSchoolCodeUseCase-any CheckSchoolCodeUseCase"] = { self.checkSchoolCodeUseCase as Any }
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
        keyPathToName[\IDSettingDependency.checkAccountIDIsExistUseCase] = "checkAccountIDIsExistUseCase-any CheckAccountIDIsExistUseCase"
        keyPathToName[\IDSettingDependency.checkExistGradeClassNumberUseCase] = "checkExistGradeClassNumberUseCase-any CheckExistGradeClassNumberUseCase"
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
        keyPathToName[\MainTabDependency.applyComponent] = "applyComponent-ApplyComponent"
        keyPathToName[\MainTabDependency.noticeListComponent] = "noticeListComponent-NoticeListComponent"
        keyPathToName[\MainTabDependency.myPageComponent] = "myPageComponent-MyPageComponent"
    }
}
extension MyPageComponent: Registration {
    public func registerItems() {
        keyPathToName[\MyPageDependency.fetchMyProfileUseCase] = "fetchMyProfileUseCase-any FetchMyProfileUseCase"
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
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.signinComponent] = "signinComponent-SigninComponent"
        keyPathToName[\RootDependency.mainTabComponent] = "mainTabComponent-MainTabComponent"
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
    }
}
extension ApplyComponent: Registration {
    public func registerItems() {

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
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ApplyComponent", factory3cbfeafbe8b73941b232e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->AuthenticationEmailComponent", factory8798d0becd9d2870112af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ChangePasswordComponent", factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EnterInformationComponent", factory359a960501e79e833f64f47b58f8f304c97af4d5)
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
