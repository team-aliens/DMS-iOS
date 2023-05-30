import FilesDomainInterface
import SwiftUI
import NeedleFoundation
import SignupFeatureInterface

public protocol SignupProfileImageDependency: Dependency {
    var uploadFileUseCase: any UploadFileUseCase { get }
    var signupTermsComponent: SignupTermsComponent { get }
}

public final class SignupProfileImageComponent: Component<SignupProfileImageDependency>, SignupProfileImageFactory {
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
