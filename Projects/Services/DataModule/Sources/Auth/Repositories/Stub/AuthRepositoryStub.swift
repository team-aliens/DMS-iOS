import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct AuthRepositoryStub: AuthRepository {
    public init() {}

    public func signin(req: SigninRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).mapError { $0.asDMSError }
            .eraseToAnyPublisher()
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).mapError { $0.asDMSError }
            .eraseToAnyPublisher()
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).mapError { $0.asDMSError }
            .eraseToAnyPublisher()
    }

    public func checkEmailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).mapError { $0.asDMSError }
            .eraseToAnyPublisher()
    }

    public func checkAccountIDIsExist(id: String) -> AnyPublisher<String, DmsError> {
        Just("abc******@gmail.com").mapError { $0.asDMSError }
            .eraseToAnyPublisher()
    }
}
