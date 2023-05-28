import Combine

public protocol SchoolRepository {
    func fetchSchoolList() -> AnyPublisher<[SchoolEntity], Error>
    func fetchSchoolQuestion(schoolID: String) -> AnyPublisher<String, Error>
    func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, Error>
    func checkSchoolCode(code: String) -> AnyPublisher<String, Error>
}
