import BaseFeature
import Combine
import DomainModule

final class AuthenticationEmailViewModel: BaseViewModel {

    @Published var email = ""
    @Published var id = ""
    @Published var name = ""
    @Published var authenticationCode = ""

    private let verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    private let sendAuthCodeUseCase: any SendAuthCodeUseCase

    public init(
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase,
        sendAuthCodeUseCase: any SendAuthCodeUseCase
    ) {
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
    }
}
