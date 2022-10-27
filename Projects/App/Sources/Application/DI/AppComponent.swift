import NeedleFoundation
import SwiftUI
import KeychainModule

import SignupFeature

import FindIDFeature
import SigninFeature
import RenewalPasswordFeature
import MainTabFeature
import HomeFeature

public final class AppComponent: BootstrapComponent {
    public func makeRootView() -> some View {
        Text("Testing")
    }

    public var keychain: any Keychain {
        KeychainImpl()
    }
}

// MARK: - Auth
public extension AppComponent {
    var schoolCodeComponent: SchoolCodeComponent {
        SchoolCodeComponent(parent: self)
    }
    var findIDComponent: FindIDComponent {
        FindIDComponent(parent: self)
    }
    var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }
    var schoolConfirmationQuestionsComponent: SchoolConfirmationQuestionsComponent {
        SchoolConfirmationQuestionsComponent(parent: self)
    }
    var signupEmailVerifyComponent: SignupEmailVerifyComponent {
        SignupEmailVerifyComponent(parent: self)
    }
    var signupEmailAuthCodeVerifyComponent: SignupEmailAuthCodeVerifyComponent {
        SignupEmailAuthCodeVerifyComponent(parent: self)
    }
    var enterInformationComponent: EnterInformationComponent {
        EnterInformationComponent(parent: self)
    }
    var authenticationEmailComponent: AuthenticationEmailComponent {
        AuthenticationEmailComponent(parent: self)
    }
    var changePasswordComponent: ChangePasswordComponent {
        ChangePasswordComponent(parent: self)
    }
    var signupProfileImageComponent: SignupProfileImageComponent {
        SignupProfileImageComponent(parent: self)
    }
    var signupPasswordComponent: SignupPasswordComponent {
        SignupPasswordComponent(parent: self)
    var signupTermsComponent: SignupTermsComponent {
        SignupTermsComponent(parent: self)
    }
}

// MARK: - Main
public extension AppComponent {
    var mainTabComponent: MainTabComponent {
        MainTabComponent(parent: self)
    }
    var homeComponent: HomeComponent {
        HomeComponent(parent: self)
    }
}
