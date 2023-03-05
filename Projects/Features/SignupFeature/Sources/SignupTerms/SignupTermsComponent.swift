import DomainModule
import SwiftUI
import NeedleFoundation

public protocol SignupTermsDependency: Dependency {
    var signupUseCase: any SignupUseCase { get }
}

public final class SignupTermsComponent: Component<SignupTermsDependency> {
    public func makeView(signupTermsParam: SignupTermsParam) -> some View {
        SignupTermsView(
            viewModel: .init(
                signupUseCase: self.dependency.signupUseCase,
                signupTermsParam: signupTermsParam
            )
        )
    }
}
