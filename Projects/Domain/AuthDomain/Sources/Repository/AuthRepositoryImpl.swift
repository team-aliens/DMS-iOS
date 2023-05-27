import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule
import DatabaseModule

public struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource
    private let localAuthDataSource: any LocalAuthDataSource

    public init(
        remoteAuthDataSource: any RemoteAuthDataSource,
        localAuthDataSource: any LocalAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
        self.localAuthDataSource = localAuthDataSource
    }

    public func logout() {
        localAuthDataSource.logout()
    }

    public func signin(req: SigninRequestDTO) -> AnyPublisher<DmsFeatures, Error> {
        remoteAuthDataSource.signin(req: req)
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.verifyAuthCode(req: req)
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.sendAuthCode(req: req)
    }

    public func reissueToken() -> AnyPublisher<DmsFeatures, Error> {
        remoteAuthDataSource.reissueToken()
    }

    public func checkEmailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, Error> {
        remoteAuthDataSource.checkEmailExistByAccountID(req: req)
    }

    public func checkAccountIDIsExist(id: String) -> AnyPublisher<String, Error> {
        remoteAuthDataSource.checkAccountIDIsExist(id: id)
    }
}
