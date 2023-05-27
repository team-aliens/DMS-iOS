import AuthDomainInterface
import BaseDomain
import Combine

public final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthAPI>, RemoteAuthDataSource {
    public func signin(req: SigninRequestDTO) -> AnyPublisher<DmsFeatures, Error> {
        request(.signin(req), dto: DmsFeaturesResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        request(.verifyAuthCode(req))
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        request(.sendAuthCode(req))
    }

    public func reissueToken() -> AnyPublisher<DmsFeatures, Error> {
        request(.reissueToken, dto: DmsFeaturesResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func checkEmailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, Error> {
        request(.checkEmailExistByAccountID(req))
    }

    public func checkAccountIDIsExist(id: String) -> AnyPublisher<String, Error> {
        request(.checkAccountIDIsExist(id: id), dto: CheckAccountIDIsExistResponseDTO.self)
            .map(\.email)
            .eraseToAnyPublisher()
    }
}
