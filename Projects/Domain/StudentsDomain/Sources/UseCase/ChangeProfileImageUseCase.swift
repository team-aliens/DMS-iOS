import Combine
import DomainModule
import ErrorModule

public struct ChangeProfileImageUseCaseImpl: ChangeProfileImageUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(url: String) -> AnyPublisher<Void, Error> {
        studentsRepository.changeProfileImage(url: url)
    }
}
