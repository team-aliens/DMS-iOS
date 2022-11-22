import DomainModule
import SwiftUI
import NeedleFoundation

public protocol ModifyPasswordDependency: Dependency {
    var changePasswordUseCase: any ChangePasswordUseCase { get }
    var currentPassword: String { get }
}

public final class MyPageComponent: Component<ModifyPasswordDependency> {
    public func makeView() -> some View {
        ModifyPasswordView(
            viewModel: .init(
                changePasswordUseCase: self.dependency.changePasswordUseCase
            )
        )
    }
}
