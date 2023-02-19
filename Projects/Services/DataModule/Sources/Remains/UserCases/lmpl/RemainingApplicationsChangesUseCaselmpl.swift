import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct RemainingApplicationsChangesUseCaselmpl: RemainingApplicationsChangesUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }
    public func execute(id: String) -> AnyPublisher<Void, ErrorModule.DmsError> {
        remainsRepository.remainingApplicationsChanges(id: id)
    }
}
