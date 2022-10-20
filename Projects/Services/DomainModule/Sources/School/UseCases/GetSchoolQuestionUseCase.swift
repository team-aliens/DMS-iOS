import Combine
import DataMappingModule
import ErrorModule

public protocol GetSchoolQuestionUseCase {
    func execute(authCode: String) -> AnyPublisher<CheckSchoolQuestionResponseDTO, DmsError>
}
