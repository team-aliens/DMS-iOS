

import DataModule
import DomainModule
import FindIDFeature
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

private class SchoolCodeDependencyc0114744c1c8c7843672Provider: SchoolCodeDependency {
    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase {
        return appComponent.checkSchoolCodeUseCase
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
extension SchoolCodeComponent: Registration {
    public func registerItems() {
        keyPathToName[\SchoolCodeDependency.checkSchoolCodeUseCase] = "checkSchoolCodeUseCase-any CheckSchoolCodeUseCase"
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
    registerProviderFactory("^->AppComponent->SchoolCodeComponent", factoryb65c1efbf06b87162473f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindIDComponent", factory8dd2f9e0b545ead35ecaf47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
