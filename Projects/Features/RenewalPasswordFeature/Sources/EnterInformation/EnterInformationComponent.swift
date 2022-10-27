import DomainModule
import NeedleFoundation
import SwiftUI

public protocol EnterInformationDependency: Dependency {
    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase { get }
    var authenticationEmailComponent: AuthenticationEmailComponent { get }
}

public final class EnterInformationComponent: Component<EnterInformationDependency> {
    public func makeView() -> some View {
        EnterInformationView(
            viewModel: .init(
                checkAccountIDIsExistUseCase: self.dependency.checkAccountIDIsExistUseCase
            ),
            authenticationEmailComponent: dependency.authenticationEmailComponent
        )
    }
}
