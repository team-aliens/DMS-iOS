import Combine
import DataMappingModule
import ErrorModule

public protocol FetchSchoolQuestionUseCase {
    func execute(schoolID: String) -> AnyPublisher<String, DmsError>
}
