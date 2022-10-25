import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource

    public init(remoteAuthDataSource: any RemoteAuthDataSource) {
        self.remoteAuthDataSource = remoteAuthDataSource
    }

    public func signin(req: SigninRequestDTO) -> AnyPublisher<DmsFeatures, DmsError> {
        remoteAuthDataSource.signin(req: req)
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError> {
        remoteAuthDataSource.verifyAuthCode(req: req)
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError> {
        remoteAuthDataSource.sendAuthCode(req: req)
    }

    public func reissueToken() -> AnyPublisher<DmsFeatures, DmsError> {
        remoteAuthDataSource.reissueToken()
    }

    public func checkEmailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, DmsError> {
        remoteAuthDataSource.checkEmailExistByAccountID(req: req)
    }

    public func checkAccountIDIsExist(id: String) -> AnyPublisher<String, DmsError> {
        remoteAuthDataSource.checkAccountIDIsExist(id: id)
    }
}
