import Combine

public protocol CheckSchoolCodeUseCase {
    func execute(code: String) -> AnyPublisher<String, Error>
}
