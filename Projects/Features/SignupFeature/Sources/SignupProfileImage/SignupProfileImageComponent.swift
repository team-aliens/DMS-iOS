import DomainModule
import SwiftUI
import NeedleFoundation

public protocol SignupProfileImageDependency: Dependency {
    var uploadFileUseCase: any UploadFileUseCase { get }
    var signupTermsComponent: SignupTermsComponent { get }
}

public final class SignupProfileImageComponent: Component<SignupProfileImageDependency> {
    public func makeView(signupProfileImageParam: SignupProfileImageParam) -> some View {
        SignupProfileImageView(
            viewModel: .init(
                uploadFileUseCase: self.dependency.uploadFileUseCase,
                signupProfileImageParam: signupProfileImageParam
            ),
            signupTermsComponent: self.dependency.signupTermsComponent
        )
    }
}
