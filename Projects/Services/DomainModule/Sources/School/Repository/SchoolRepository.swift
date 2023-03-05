import Combine
import DataMappingModule
import ErrorModule

public protocol SchoolRepository {
    func fetchSchoolList() -> AnyPublisher<[SchoolEntity], DmsError>
    func fetchSchoolQuestion(schoolID: String) -> AnyPublisher<String, DmsError>
    func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError>
    func checkSchoolCode(code: String) -> AnyPublisher<String, DmsError>
}
