import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct RemainingApplicationsChangesUseCaseImpl: RemainingApplicationsChangesUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }

    public func execute(id: String) -> AnyPublisher<Void, ErrorModule.Error> {
        remainsRepository.remainingApplicationsChanges(id: id)
    }
}
