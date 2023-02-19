import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchRemainsAvailableTimeUseCaselmpl: FetchRemainsAvailableTimeUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }
    
    public func execute() -> AnyPublisher<DomainModule.RemainsAvailableTimeEntity, ErrorModule.DmsError> {
        remainsRepository.fetchRemainsAvailableTime()
    }
}
