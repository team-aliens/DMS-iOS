import NeedleFoundation
import SwiftUI
import KeychainModule
import SignupFeature
import RootFeature
import FindIDFeature
import SigninFeature
import RenewalPasswordFeature
import MainTabFeature
import HomeFeature
import ApplyFeature
import StudyRoomFeature
import RemainApplyFeature
import MyPageFeature
import NoticeFeature
import SplashFeature

public final class AppComponent: BootstrapComponent {
    private let _keychain: any Keychain

    init(keychain: any Keychain) {
        self._keychain = keychain
    }

    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

    public var keychain: any Keychain {
        shared {
            _keychain
        }
    }

    var rootComponent: RootComponent {
        shared {
            RootComponent(parent: self)
        }
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
    var splashComponent: SplashComponent {
        SplashComponent(parent: self)
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
    var idSettingComponent: IDSettingComponent {
        IDSettingComponent(parent: self)
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
    }
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
    var studyRoomDetailComponent: StudyRoomDetailComponent {
        StudyRoomDetailComponent(parent: self)
    }
    var noticeListComponent: NoticeListComponent {
        NoticeListComponent(parent: self)
    }
    var myPageComponent: MyPageComponent {
        MyPageComponent(parent: self)
    }
    var changeProfileComponent: ChangeProfileComponent {
        ChangeProfileComponent(parent: self)
    }
    var noticeDetailComponent: NoticeDetailComponent {
        NoticeDetailComponent(parent: self)
    }
    var rewardPointDetailComponent: RewardPointDetailComponent {
        RewardPointDetailComponent(parent: self)
    }
    var checkPasswordComponent: CheckPasswordComponent {
        CheckPasswordComponent(parent: self)
    }
    var modifyPasswordComponent: ModifyPasswordComponent {
        ModifyPasswordComponent(parent: self)
    }
    var studyRoomListComponent: StudyRoomListComponent {
        StudyRoomListComponent(parent: self)
    }
    var applyPageComponent: ApplyPageComponent {
        ApplyPageComponent(parent: self)
    }
    var remainApplyComponent: RemainApplyComponent {
        RemainApplyComponent(parent: self)
    }
}
