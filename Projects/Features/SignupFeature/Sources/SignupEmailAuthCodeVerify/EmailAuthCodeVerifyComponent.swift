import DomainModule
import NeedleFoundation
import SwiftUI

public protocol SignupEmailAuthCodeVerifyDependency: Dependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
    var idSettingComponent: IDSettingComponent { get }
}

public final class SignupEmailAuthCodeVerifyComponent: Component<SignupEmailAuthCodeVerifyDependency> {
    public func makeView(signupEmailAuthCodeVerifyParam: SignupEmailAuthCodeVerifyParam) -> some View {
        SignupEmailAuthCodeVerifyView(
            viewModel: .init(
                sendAuthCodeUseCase: dependency.sendAuthCodeUseCase,
                verifyAuthCodeUseCase: dependency.verifyAuthCodeUseCase,
                signupEmailAuthCodeVerifyParam: signupEmailAuthCodeVerifyParam
            ),
            idSettingComponent: dependency.idSettingComponent
        )
    }
}
