import Combine
import DataMappingModule
import ErrorModule

public protocol SchoolRepository {
    func getSchoolList() -> AnyPublisher<FetchSchoolListResponseDTO, DmsError>
    func getSchoolQuestion(authCode: String) -> AnyPublisher<CheckSchoolQuestionResponseDTO, DmsError>
    func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError>
    func checkSchoolAuthCode(schoolID: String, code: String) -> AnyPublisher<CheckSchoolAuthCodeResponseDTO, DmsError>
}
