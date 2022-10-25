import Combine
import DataMappingModule
import ErrorModule

public protocol AuthRepository {
    func signin(req: SigninRequestDTO) -> AnyPublisher<DmsFeatures, DmsError>
    func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError>
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError>
    func reissueToken() -> AnyPublisher<DmsFeatures, DmsError>
    func checkEmailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, DmsError>
    func checkAccountIDIsExist(id: String) -> AnyPublisher<String, DmsError>
}
