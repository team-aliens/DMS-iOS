import BaseFeature
import Combine
import DomainModule

final class ModifyPasswordViewModel: BaseViewModel {
    @Published var password: String = ""

    private let changePasswordUseCase: any ChangePasswordUseCase

    public init(
        changePasswordUseCase: any ChangePasswordUseCase
    ) {
        self.changePasswordUseCase = changePasswordUseCase
    }
}
