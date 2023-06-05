import Combine
import SchoolDomainInterface

public struct SchoolRepositoryStub: SchoolRepository {
    public init() {}

    public func fetchSchoolList() -> AnyPublisher<[SchoolEntity], Error> {
        Just([
            SchoolEntity(
                id: "aa-bb-pk",
                name: "대덕소프트웨어마이스터고등학교",
                address: "대전광역시 유성구 가정북로 76"
            )
        ]).setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func fetchSchoolQuestion(schoolID: String) -> AnyPublisher<String, Error> {
        Just("우리 학교의 학생 수는 몇 명입니까?")
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, Error> {
        Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func checkSchoolCode(code: String) -> AnyPublisher<String, Error> {
        Just("b77eafed-69ab-422d-8448-1ec1f0a2eb8c")
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
