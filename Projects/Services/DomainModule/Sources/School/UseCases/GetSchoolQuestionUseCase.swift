import Combine
import DataMappingModule
import ErrorModule

public protocol FetchSchoolQuestionUseCase {
    func execute(authCode: String) -> AnyPublisher<String, DmsError>
}
