import StudentsDomain
import SwiftUI
import NeedleFoundation
import SignupFeatureInterface

public protocol SignupTermsDependency: Dependency {
    var signupUseCase: any SignupUseCase { get }
}

public final class SignupTermsComponent: Component<SignupTermsDependency>, SignupTermsFactory {
    public func makeView(signupTermsParam: SignupTermsParam) -> some View {
        SignupTermsView(
            viewModel: .init(
                signupUseCase: self.dependency.signupUseCase,
                signupTermsParam: signupTermsParam
            )
        )
    }
}
