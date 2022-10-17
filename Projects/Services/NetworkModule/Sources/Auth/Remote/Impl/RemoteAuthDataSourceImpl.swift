import APIKit
import Combine
import DataMappingModule
import ErrorModule

public final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthAPI>, RemoteAuthDataSource {
    public func signin(req: SigninRequestDTO) -> AnyPublisher<Void, DmsError> {
        request(.signin(req))
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError> {
        request(.verifyAuthCode(req))
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError> {
        request(.sendAuthCode(req))
    }

    public func reissueToken() -> AnyPublisher<Void, DmsError> {
        request(.reissueToken)
    }

    public func emailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, DmsError> {
        request(.emailExistByAccountID(req))
    }

    public func checkAccountIDIsExist(id: String) -> AnyPublisher<String, DmsError> {
        request(.checkAccountIDIsExist(id: id), dto: CheckAccountIDIsExistResponseDTO.self)
            .map(\.email)
            .eraseToAnyPublisher()
    }
}