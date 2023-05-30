import AuthDomainInterface
import NeedleFoundation
import SwiftUI
import SignupFeatureInterface

public protocol SignupEmailAuthCodeVerifyDependency: Dependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
    var idSettingFactory: any IDSettingFactory { get }
}

public final class SignupEmailAuthCodeVerifyComponent:
    Component<SignupEmailAuthCodeVerifyDependency>, SignupEmailAuthCodeVerifyFactory {
    public func makeView(signupEmailAuthCodeVerifyParam: SignupEmailAuthCodeVerifyParam) -> some View {
        SignupEmailAuthCodeVerifyView(
            viewModel: .init(
                sendAuthCodeUseCase: dependency.sendAuthCodeUseCase,
                verifyAuthCodeUseCase: dependency.verifyAuthCodeUseCase,
                signupEmailAuthCodeVerifyParam: signupEmailAuthCodeVerifyParam
            ),
            idSettingFactory: dependency.idSettingFactory
        )
    }
}
