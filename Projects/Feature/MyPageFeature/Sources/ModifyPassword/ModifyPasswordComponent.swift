import DomainModule
import SwiftUI
import NeedleFoundation

public protocol ModifyPasswordDependency: Dependency {
    var changePasswordUseCase: any ChangePasswordUseCase { get }
}

public final class ModifyPasswordComponent: Component<ModifyPasswordDependency> {
    public func makeView(currentPassword: String) -> some View {
        ModifyPasswordView(
            viewModel: .init(
                changePasswordUseCase: self.dependency.changePasswordUseCase,
                currentPassword: currentPassword
            )
        )
    }
}
