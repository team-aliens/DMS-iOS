import Combine

public protocol FetchSchoolQuestionUseCase {
    func execute(schoolID: String) -> AnyPublisher<String, Error>
}
