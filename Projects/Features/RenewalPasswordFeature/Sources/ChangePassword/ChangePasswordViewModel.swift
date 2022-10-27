import BaseFeature
import Combine
import DomainModule

final class ChangePasswordViewModel: BaseViewModel {

    @Published var email = ""
    @Published var id = ""
    @Published var name = ""
    @Published var authenticationCode = ""
    @Published var password = ""
    @Published var verificationㅖassword = ""

    private let renewalPasswordUseCase: any RenewalPasswordUseCase

    public init(
        renewalPasswordUseCase: any RenewalPasswordUseCase
    ) {
        self.renewalPasswordUseCase = renewalPasswordUseCase
    }
}
