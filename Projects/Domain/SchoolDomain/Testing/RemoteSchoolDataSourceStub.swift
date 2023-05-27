import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct RemoteSchoolDataSourceStub: RemoteSchoolDataSource {
    public init() {}

    public func fetchSchoolList() -> AnyPublisher<[SchoolEntity], Error> {
        Just([
            SchoolEntity(
                id: "aa-bb-pk",
                name: "대덕소프트웨어마이스터고등학교",
                address: "대전광역시 유성구 가정북로 76"
            )
        ])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }

    public func fetchSchoolQuestion(schoolID: String) -> AnyPublisher<String, Error> {
        Just("우리 학교 학생 수는?").setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func checkSchoolCode(code: String) -> AnyPublisher<String, Error> {
        return Just("aa-bb-pk").setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
