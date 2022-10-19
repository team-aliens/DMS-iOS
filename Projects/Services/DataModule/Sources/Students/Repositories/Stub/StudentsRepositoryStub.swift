import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct StudentsRepositoryStub: StudentsRepository {
    public init() {}

    public func signup(req: SignupRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func checkDuplicateAccountID(id: String) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func checkDuplicateEmail(email: String) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func findID(req: FindIDRequestDTO) -> AnyPublisher<String, DmsError> {
        Just("abc*****@gmail.com").setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func fetchMyProfile() -> AnyPublisher<MyProfileEntity, DmsError> {
        Just(
            MyProfileEntity(
                schoolName: "광주소프트웨어마이스터고등학교",
                name: "변찬우",
                gcn: "2118",
                bonusPoint: 0,
                minusPoint: 24,
                phrase: "안녕하세요"
            )
        ).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
