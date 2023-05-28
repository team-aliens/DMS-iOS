import AuthDomainInterface
import Combine

public struct AuthRepositoryStub: AuthRepository {
    public init() {}

    public func logout() {}

    public func signin(req: SigninRequestDTO) -> AnyPublisher<SigninDmsFeatures, Error> {
        Just(SigninDmsFeatures(
            mealService: true,
            noticeService: true,
            pointService: true,
            studyRoomService: false,
            remainService: false
        ))
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func reissueToken() -> AnyPublisher<SigninDmsFeatures, Error> {
        Just(SigninDmsFeatures(
            mealService: true,
            noticeService: true,
            pointService: true,
            studyRoomService: false,
            remainService: false
        ))
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }

    public func checkEmailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func checkAccountIDIsExist(id: String) -> AnyPublisher<String, Error> {
        Just("abc******@gmail.com").setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
