import AuthDomainInterface
import NeedleFoundation
import SwiftUI
import RenewalPasswordFeatureInterface

public protocol EnterInformationDependency: Dependency {
    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase { get }
    var authenticationEmailFactory: any AuthenticationEmailFactory { get }
}

public final class EnterInformationComponent: Component<EnterInformationDependency>, EnterInformationFactory {
    public func makeView() -> some View {
        EnterInformationView(
            viewModel: .init(
                checkAccountIDIsExistUseCase: self.dependency.checkAccountIDIsExistUseCase
            ),
            authenticationEmailFactory: dependency.authenticationEmailFactory
        )
    }
}
