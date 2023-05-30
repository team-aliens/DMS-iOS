import Combine
import RemainsDomainInterface

public struct RemainingApplicationsChangesUseCaseImpl: RemainingApplicationsChangesUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }

    public func execute(id: String) -> AnyPublisher<Void, Error> {
        remainsRepository.remainingApplicationsChanges(id: id)
    }
}
