import Combine
import DataMappingModule
import ErrorModule

public protocol CheckSchoolCodeUseCase {
    func execute(code: String) -> AnyPublisher<String, Error>
}
