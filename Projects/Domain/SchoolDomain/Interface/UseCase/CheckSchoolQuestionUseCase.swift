import Combine

public protocol CheckSchoolQuestionUseCase {
    func execute(schoolID: String, answer: String) -> AnyPublisher<Void, Error>
}
