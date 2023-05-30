import StudentsDomainInterface
import NeedleFoundation
import SwiftUI
import SignupFeatureInterface

public protocol IDSettingDependency: Dependency {
    var checkExistGradeClassNumberUseCase: any CheckExistGradeClassNumberUseCase { get }
    var checkDuplicateAccountIDUseCase: any CheckDuplicateAccountIDUseCase { get }
    var signupPasswordComponent: SignupPasswordComponent { get }
}

public final class IDSettingComponent: Component<IDSettingDependency>, IDSettingFactory {
    public func makeView(idSettingParam: IDSettingParam) -> some View {
        IDSettingView(
            viewModel: .init(
                checkDuplicateAccountIDUseCase: self.dependency.checkDuplicateAccountIDUseCase,
                checkExistGradeClassNumberUseCase: self.dependency.checkExistGradeClassNumberUseCase,
                idSettingParam: idSettingParam
            ),
            signupPasswordComponent: self.dependency.signupPasswordComponent
        )
    }
}
