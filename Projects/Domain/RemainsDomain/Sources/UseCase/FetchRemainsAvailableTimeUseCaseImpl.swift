import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchRemainsAvailableTimeUseCaseImpl: FetchRemainsAvailableTimeUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }

    public func execute() -> AnyPublisher<RemainsAvailableTimeEntity, Error> {
        remainsRepository.fetchRemainsAvailableTime()
    }
}
