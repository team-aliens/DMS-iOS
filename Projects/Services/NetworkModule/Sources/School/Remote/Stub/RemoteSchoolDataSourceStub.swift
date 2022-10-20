import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct RemoteSchoolDataSourceStub: RemoteSchoolDataSource {
    public func getSchoolList() -> AnyPublisher<[SchoolEntity], DmsError> {
        Just([
            SchoolEntity(
                id: "aa-bb-pk",
                name: "대덕소프트웨어마이스터고등학교",
                address: "대전광역시 유성구 가정북로 76"
            )
        ]).mapError { $0.asDMSError }
            .eraseToAnyPublisher()
    }

    public func getSchoolQuestion(authCode: String) -> AnyPublisher<String, DmsError> {
        Just("우리 학교 학생 수는?").mapError { $0.asDMSError }
            .eraseToAnyPublisher()
    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError> {
        Just(()).mapError { $0.asDMSError }
            .eraseToAnyPublisher()
    }

    public func checkSchoolCode(schoolID: String, code: String) -> AnyPublisher<String, DmsError> {
        Just("aa-bb-pk").mapError { $0.asDMSError }
            .eraseToAnyPublisher()

    }

    public init() {}

}
