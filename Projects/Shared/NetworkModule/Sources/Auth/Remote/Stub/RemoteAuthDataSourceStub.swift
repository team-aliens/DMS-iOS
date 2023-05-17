import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct RemoteAuthDataSourceStub: RemoteAuthDataSource {
    public init() {}

    public func signin(req: SigninRequestDTO) -> AnyPublisher<DmsFeatures, DmsError> {
        Just(DmsFeatures(
            mealService: true,
            noticeService: true,
            pointService: true,
            studyRoomService: false,
            remainService: false
        ))
        .setFailureType(to: DmsError.self)
        .eraseToAnyPublisher()
    }

    public func verifyAuthCode(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func sendAuthCode(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func reissueToken() -> AnyPublisher<DmsFeatures, DmsError> {
        Just(DmsFeatures(
            mealService: true,
            noticeService: true,
            pointService: true,
            studyRoomService: false,
            remainService: false
        ))
        .setFailureType(to: DmsError.self)
        .eraseToAnyPublisher()
    }

    public func checkEmailExistByAccountID(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func checkAccountIDIsExist(id: String) -> AnyPublisher<String, DmsError> {
        Just("abc******@gmail.com").setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}