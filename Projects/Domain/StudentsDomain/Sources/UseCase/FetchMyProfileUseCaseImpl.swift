import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchMyProfileUseCaseImpl: FetchMyProfileUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute() -> AnyPublisher<MyProfileEntity, Error> {
        studentsRepository.fetchMyProfile()
    }
}
