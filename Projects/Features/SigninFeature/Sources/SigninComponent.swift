import DomainModule
import NeedleFoundation
import SwiftUI

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
}

public final class SigninComponent: Component<SigninDependency> {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(
                signinUseCase: dependency.signinUseCase
            )
        )
    }
}
