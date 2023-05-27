import Combine

public protocol AuthRepository {
    func logout()
    func signin(req: SigninRequestDTO) -> AnyPublisher<DmsFeatures, Error>
    func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
    func reissueToken() -> AnyPublisher<DmsFeatures, Error>
    func checkEmailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, Error>
    func checkAccountIDIsExist(id: String) -> AnyPublisher<String, Error>
}
