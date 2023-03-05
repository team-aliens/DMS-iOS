import Combine
import DataMappingModule
import ErrorModule

public protocol CheckSchoolQuestionUseCase {
    func execute(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError>
}
