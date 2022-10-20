import Combine
import DataMappingModule
import ErrorModule

public protocol SchoolRepository {
    func getSchoolList() -> AnyPublisher<[SchoolEntity], DmsError>
    func getSchoolQuestion(authCode: String) -> AnyPublisher<String, DmsError>
    func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError>
    func checkSchoolCode(schoolID: String, code: String) -> AnyPublisher<String, DmsError>
}
