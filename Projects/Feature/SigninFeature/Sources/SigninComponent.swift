import SigninFeatureInterface
import SwiftUI
import AuthDomainInterface
import NeedleFoundation
import FindIDFeatureInterface
import SignupFeatureInterface
import RenewalPasswordFeatureInterface

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
    var schoolCodeFactory: any SchoolCodeFactory { get }
    var findIDFactory: any FindIDFactory { get }
    var enterInformationFactory: any EnterInformationFactory { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(
                signinUseCase: self.dependency.signinUseCase
            ),
            schoolCodeFactory: self.dependency.schoolCodeFactory,
            findIDFactory: self.dependency.findIDFactory,
            enterInformationFactory: self.dependency.enterInformationFactory
        )
    }
}
