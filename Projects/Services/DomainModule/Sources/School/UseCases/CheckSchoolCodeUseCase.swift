import Combine
import DataMappingModule
import ErrorModule

public protocol CheckSchoolCodeUseCase {
    func execute(schoolID: String, code: String) -> AnyPublisher<String, DmsError>
}
