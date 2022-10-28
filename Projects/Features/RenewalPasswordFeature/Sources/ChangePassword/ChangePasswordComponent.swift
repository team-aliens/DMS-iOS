import DomainModule
import NeedleFoundation
import SwiftUI

public protocol ChangePasswordDependency: Dependency {
    var renewalPasswordUseCase: any RenewalPasswordUseCase { get }
}

public final class ChangePasswordComponent: Component<ChangePasswordDependency> {
    public func makeView(changePasswordParm: ChangePasswordParm) -> some View {
        ChangePasswordView(
            viewModel: .init(
                renewalPasswordUseCase: self.dependency.renewalPasswordUseCase,
                changePasswordParm: changePasswordParm
            )
        )
    }
}
