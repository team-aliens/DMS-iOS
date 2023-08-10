import UsersDomainInterface
import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface

public protocol ModifyPasswordDependency: Dependency {
    var changePasswordUseCase: any ChangePasswordUseCase { get }
}

public final class ModifyPasswordComponent: Component<ModifyPasswordDependency>, ModifyPasswordFactory {
    public func makeView(currentPassword: String) -> some View {
        ModifyPasswordView(
            viewModel: .init(
                changePasswordUseCase: self.dependency.changePasswordUseCase,
                currentPassword: currentPassword
            )
        )
    }
}
