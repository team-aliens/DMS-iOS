import DesignSystem
import FilesDomainInterface
import StudentsDomainInterface
import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface

public protocol ChangeProfileDependency: Dependency {
    var changeProfileImageUseCase: any ChangeProfileImageUseCase { get }
    var uploadFileUseCase: any UploadFileUseCase { get }
}

public final class ChangeProfileComponent:
    Component<ChangeProfileDependency>, ChangeProfileFactory {
    public func makeView() -> some View {
        ChangeProfileView(
            viewModel: .init(
                changeProfileImageUseCase: self.dependency.changeProfileImageUseCase,
                uploadFileUseCase: self.dependency.uploadFileUseCase
            )
        )
    }
}
