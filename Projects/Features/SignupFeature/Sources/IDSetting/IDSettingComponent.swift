import DomainModule
import NeedleFoundation
import SwiftUI

public protocol IDSettingDependency: Dependency {
    var checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase { get }
    var checkExistGradeClassNumberUseCase: any CheckExistGradeClassNumberUseCase { get }
    var signupPasswordComponent: SignupPasswordComponent { get }
}

public final class IDSettingComponent: Component<IDSettingDependency> {
    public func makeView(idSettingParam: IDSettingParam) -> some View {
        IDSettingView(
            viewModel: .init(
                checkAccountIDIsExistUseCase: self.dependency.checkAccountIDIsExistUseCase,
                checkExistGradeClassNumberUseCase: self.dependency.checkExistGradeClassNumberUseCase,
                idSettingParam: idSettingParam
            ),
            signupPasswordComponent: self.dependency.signupPasswordComponent
        )
    }
}
