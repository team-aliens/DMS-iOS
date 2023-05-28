import Combine

public protocol CheckExistGradeClassNumberUseCase {
    func execute(req: CheckExistGradeClassNumberRequestDTO) -> AnyPublisher<String, Error>
}
