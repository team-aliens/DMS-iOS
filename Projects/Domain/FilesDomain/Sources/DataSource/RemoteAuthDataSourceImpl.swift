import AuthDomainInterface
import BaseDomain
import Combine

public final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthAPI>, RemoteAuthDataSource {
    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        request(.sendAuthCode(req))
    }

    public func reissueToken() -> AnyPublisher<Void, Error> {
        request(.reissueToken)
    }

    public func verifyAuthCode(email: String, authCode: String) -> AnyPublisher<Void, Error> {
        request(.verifyAuthCode(email: email, authCode: authCode))
    }
}
