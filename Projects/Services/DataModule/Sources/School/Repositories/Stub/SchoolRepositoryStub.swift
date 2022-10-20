import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct SchoolRepositoryStub: SchoolRepository {
    public init() {}

    public func getSchoolList() -> AnyPublisher<[SchoolEntity], DmsError> {
        Just([
            SchoolEntity(
                id: "aa-bb-pk",
                name: "대덕소프트웨어마이스터고등학교",
                address: "대전광역시 유성구 가정북로 76"
            )
        ]).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func getSchoolQuestion(authCode: String) -> AnyPublisher<String, DmsError> {
        Just("우리 학교의 학생 수는 몇 명입니까?")
            .setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError> {
        Just(())
            .setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func checkSchoolCode(schoolID: String, code: String) -> AnyPublisher<String, DmsError> {
        Just("b77eafed-69ab-422d-8448-1ec1f0a2eb8c")
            .setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
