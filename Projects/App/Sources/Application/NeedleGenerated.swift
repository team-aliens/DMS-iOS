

import DataModule
import DomainModule
import FindIDFeature
import KeychainModule
import MainTabFeature
import NeedleFoundation
import NetworkModule
import RenewalPasswordFeature
import SigninFeature
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider()
}
private class SigninDependencyde06a9d0b22764487733Provider: SigninDependency {
    var signinUseCase: any SigninUseCase {
        return appComponent.signinUseCase
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
private class EnterInformationDependency9204f24c784151f429ddProvider: EnterInformationDependency {
    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase {
        return appComponent.checkAccountIDIsExistUseCase
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
private class AuthenticationEmailDependency73189eb572618b10e0fbProvider: AuthenticationEmailDependency {
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        return appComponent.verifyAuthCodeUseCase
    }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        return appComponent.sendAuthCodeUseCase
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
        localTable["findIDComponent-FindIDComponent"] = { self.findIDComponent as Any }
        localTable["signinComponent-SigninComponent"] = { self.signinComponent as Any }
        localTable["enterInformationComponent-EnterInformationComponent"] = { self.enterInformationComponent as Any }
        localTable["authenticationEmailComponent-AuthenticationEmailComponent"] = { self.authenticationEmailComponent as Any }
        localTable["changePasswordComponent-ChangePasswordComponent"] = { self.changePasswordComponent as Any }
        localTable["mainTabComponent-MainTabComponent"] = { self.mainTabComponent as Any }
        localTable["remoteStudentsDataSource-any RemoteStudentsDataSource"] = { self.remoteStudentsDataSource as Any }
        localTable["studentsRepository-any StudentsRepository"] = { self.studentsRepository as Any }
        localTable["signupUseCase-any SignupUseCase"] = { self.signupUseCase as Any }
        localTable["checkDuplicateAccountIDUseCase-any CheckDuplicateAccountIDUseCase"] = { self.checkDuplicateAccountIDUseCase as Any }
        localTable["checkDuplicateEmailUseCase-any CheckDuplicateEmailUseCase"] = { self.checkDuplicateEmailUseCase as Any }
        localTable["renewalPasswordUseCase-any RenewalPasswordUseCase"] = { self.renewalPasswordUseCase as Any }
        localTable["findIDUseCase-any FindIDUseCase"] = { self.findIDUseCase as Any }
        localTable["fetchMyProfileUseCase-any FetchMyProfileUseCase"] = { self.fetchMyProfileUseCase as Any }
        localTable["remoteSchoolDataSource-any RemoteSchoolDataSource"] = { self.remoteSchoolDataSource as Any }
        localTable["schoolRepository-any SchoolRepository"] = { self.schoolRepository as Any }
        localTable["fetchSchoolListUseCase-any FetchSchoolListUseCase"] = { self.fetchSchoolListUseCase as Any }
        localTable["fetchSchoolQuestionUseCase-any FetchSchoolQuestionUseCase"] = { self.fetchSchoolQuestionUseCase as Any }
        localTable["checkSchoolQuestionUseCase-any CheckSchoolQuestionUseCase"] = { self.checkSchoolQuestionUseCase as Any }
        localTable["checkSchoolCodeUseCase-any CheckSchoolCodeUseCase"] = { self.checkSchoolCodeUseCase as Any }
    }
}
extension MainTabComponent: Registration {
    public func registerItems() {

    }
}
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.signinUseCase] = "signinUseCase-any SigninUseCase"
    }
}
extension EnterInformationComponent: Registration {
    public func registerItems() {
        keyPathToName[\EnterInformationDependency.checkAccountIDIsExistUseCase] = "checkAccountIDIsExistUseCase-any CheckAccountIDIsExistUseCase"
    }
}
extension AuthenticationEmailComponent: Registration {
    public func registerItems() {
        keyPathToName[\AuthenticationEmailDependency.verifyAuthCodeUseCase] = "verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"
        keyPathToName[\AuthenticationEmailDependency.sendAuthCodeUseCase] = "sendAuthCodeUseCase-any SendAuthCodeUseCase"
    }
}
extension ChangePasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\ChangePasswordDependency.renewalPasswordUseCase] = "renewalPasswordUseCase-any RenewalPasswordUseCase"
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
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EnterInformationComponent", factory359a960501e79e833f64f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AuthenticationEmailComponent", factory8798d0becd9d2870112af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ChangePasswordComponent", factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindIDComponent", factory8dd2f9e0b545ead35ecaf47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
