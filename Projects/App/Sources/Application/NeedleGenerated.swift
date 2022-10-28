

import DataModule
import DomainModule
import FindIDFeature
import HomeFeature
import KeychainModule
import MainTabFeature
import NeedleFoundation
import NetworkModule
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
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider(appComponent: parent1(component) as! AppComponent)
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
        localTable["signupProfileImageComponent-SignupProfileImageComponent"] = { self.signupProfileImageComponent as Any }
        localTable["signupPasswordComponent-SignupPasswordComponent"] = { self.signupPasswordComponent as Any }
        localTable["signupTermsComponent-SignupTermsComponent"] = { self.signupTermsComponent as Any }
        localTable["mainTabComponent-MainTabComponent"] = { self.mainTabComponent as Any }
        localTable["homeComponent-HomeComponent"] = { self.homeComponent as Any }
        localTable["remoteStudentsDataSource-any RemoteStudentsDataSource"] = { self.remoteStudentsDataSource as Any }
        localTable["studentsRepository-any StudentsRepository"] = { self.studentsRepository as Any }
        localTable["signupUseCase-any SignupUseCase"] = { self.signupUseCase as Any }
        localTable["checkDuplicateAccountIDUseCase-any CheckDuplicateAccountIDUseCase"] = { self.checkDuplicateAccountIDUseCase as Any }
        localTable["checkDuplicateEmailUseCase-any CheckDuplicateEmailUseCase"] = { self.checkDuplicateEmailUseCase as Any }
        localTable["renewalPasswordUseCase-any RenewalPasswordUseCase"] = { self.renewalPasswordUseCase as Any }
        localTable["findIDUseCase-any FindIDUseCase"] = { self.findIDUseCase as Any }
        localTable["checkExistGradeClassNumberUseCase-any CheckExistGradeClassNumberUseCase"] = { self.checkExistGradeClassNumberUseCase as Any }
        localTable["fetchMyProfileUseCase-any FetchMyProfileUseCase"] = { self.fetchMyProfileUseCase as Any }
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
    }
}
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.signinUseCase] = "signinUseCase-any SigninUseCase"
        keyPathToName[\SigninDependency.schoolCodeComponent] = "schoolCodeComponent-SchoolCodeComponent"
        keyPathToName[\SigninDependency.findIDComponent] = "findIDComponent-FindIDComponent"
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.fetchMealListUseCase] = "fetchMealListUseCase-any FetchMealListUseCase"
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

private func register1() {
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
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindIDComponent", factory8dd2f9e0b545ead35ecaf47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
