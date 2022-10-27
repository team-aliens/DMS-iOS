import DomainModule
import NeedleFoundation
import SwiftUI

public protocol ChangePasswordDependency: Dependency {
    var renewalPasswordUseCase: any RenewalPasswordUseCase { get }
}

public final class ChangePasswordComponent: Component<ChangePasswordDependency> {
    public func makeView() -> some View {
        ChangePasswordView(
            viewModel: .init(
                renewalPasswordUseCase: self.dependency.renewalPasswordUseCase
            )
        )
    }
}
