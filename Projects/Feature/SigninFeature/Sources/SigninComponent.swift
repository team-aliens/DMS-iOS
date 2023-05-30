import SchoolDomainInterface
import AuthDomainInterface
import FindIDFeature
import NeedleFoundation
import SwiftUI
import SignupFeature
import RenewalPasswordFeature
import SigninFeatureInterface

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
    var schoolCodeComponent: SchoolCodeComponent { get }
    var findIDComponent: FindIDComponent { get }
    var enterInformationComponent: EnterInformationComponent { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(
                signinUseCase: self.dependency.signinUseCase
            ),
            schoolCodeComponent: self.dependency.schoolCodeComponent,
            findIDComponent: self.dependency.findIDComponent,
            enterInformationComponent: self.dependency.enterInformationComponent
        )
    }
}
