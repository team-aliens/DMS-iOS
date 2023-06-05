import Combine
import Foundation

public protocol RemoteAuthDataSource {
    func signin(req: SigninRequestDTO) -> AnyPublisher<SigninDmsFeatures, Error>
    func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func reissueToken() -> AnyPublisher<SigninDmsFeatures, Error>
    func checkEmailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, Error>
    func checkAccountIDIsExist(id: String) -> AnyPublisher<String, Error>
}
