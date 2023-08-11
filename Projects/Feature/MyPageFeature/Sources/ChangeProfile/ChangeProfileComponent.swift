import DesignSystem
import FilesDomainInterface
import StudentsDomainInterface
import SwiftUI
import NeedleFoundation
import MyPageFeatureInterface

public protocol ChangeProfileDependency: Dependency {
    var changeProfileImageUseCase: any ChangeProfileImageUseCase { get }
    var uploadFileUseCase: any UploadFileUseCase { get }
    var fetchPresignedURLUseCase: any FetchPresignedURLUseCase { get }
    var presignedUploadFileUseCase: any PresignedUploadFileUseCase { get }
}

public final class ChangeProfileComponent:
    Component<ChangeProfileDependency>, ChangeProfileFactory {
    public func makeView() -> some View {
        ChangeProfileView(
            viewModel: .init(
                changeProfileImageUseCase: self.dependency.changeProfileImageUseCase,
                uploadFileUseCase: self.dependency.uploadFileUseCase,
                fetchPresignedURLUseCase: self.dependency.fetchPresignedURLUseCase,
                presigendUploadFileUseCase: self.dependency.presignedUploadFileUseCase
            )
        )
    }
}
