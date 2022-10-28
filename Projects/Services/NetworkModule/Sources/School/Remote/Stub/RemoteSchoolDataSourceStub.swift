import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct RemoteSchoolDataSourceStub: RemoteSchoolDataSource {
    public init() {}

    public func fetchSchoolList() -> AnyPublisher<[SchoolEntity], DmsError> {
        Just([
            SchoolEntity(
                id: "aa-bb-pk",
                name: "대덕소프트웨어마이스터고등학교",
                address: "대전광역시 유성구 가정북로 76"
            )
        ])
        .setFailureType(to: DmsError.self)
        .eraseToAnyPublisher()
    }

    public func fetchSchoolQuestion(authCode: String) -> AnyPublisher<String, DmsError> {
        Just("우리 학교 학생 수는?").setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func checkSchoolCode(code: String) -> AnyPublisher<String, DmsError> {
        return Just("aa-bb-pk").setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
