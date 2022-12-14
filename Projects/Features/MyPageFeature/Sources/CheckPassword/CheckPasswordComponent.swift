import DomainModule
import SwiftUI
import NeedleFoundation

public protocol CheckPasswordDependency: Dependency {
    var compareCurrentPasswordUseCase: any CompareCurrentPasswordUseCase { get }
    var modifyPasswordComponent: ModifyPasswordComponent { get }
}

public final class CheckPasswordComponent: Component<CheckPasswordDependency> {
    public func makeView() -> some View {
        CheckPasswordView(
            viewModel: .init(
                compareCurrentPasswordUseCase: self.dependency.compareCurrentPasswordUseCase
            ),
            modifyPasswordComponent: self.dependency.modifyPasswordComponent
        )
    }
}
