import StudentsDomainInterface
import NeedleFoundation
import SwiftUI
import RenewalPasswordFeatureInterface

public protocol ChangePasswordDependency: Dependency {
    var renewalPasswordUseCase: any RenewalPasswordUseCase { get }
}

public final class ChangePasswordComponent: Component<ChangePasswordDependency>, ChangePasswordFactory {
    public func makeView(changePasswordParm: ChangePasswordParm) -> some View {
        ChangePasswordView(
            viewModel: .init(
                renewalPasswordUseCase: self.dependency.renewalPasswordUseCase,
                changePasswordParm: changePasswordParm
            )
        )
    }
}
