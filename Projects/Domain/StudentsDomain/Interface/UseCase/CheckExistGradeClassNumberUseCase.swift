import Combine
import DataMappingModule
import ErrorModule

public protocol CheckExistGradeClassNumberUseCase {
    func execute(req: CheckExistGradeClassNumberRequestDTO) -> AnyPublisher<String, Error>
}
