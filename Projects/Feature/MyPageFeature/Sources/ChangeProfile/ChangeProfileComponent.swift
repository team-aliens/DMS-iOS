import DesignSystem
import DomainModule
import SwiftUI
import NeedleFoundation

public protocol ChangeProfileDependency: Dependency {
    var changeProfileImageUseCase: any ChangeProfileImageUseCase { get }
    var uploadFileUseCase: any UploadFileUseCase { get }
}

public final class ChangeProfileComponent: Component<ChangeProfileDependency> {
    public func makeView() -> some View {
        ChangeProfileView(
            viewModel: .init(
                changeProfileImageUseCase: self.dependency.changeProfileImageUseCase,
                uploadFileUseCase: self.dependency.uploadFileUseCase
            )
        )
    }
}
