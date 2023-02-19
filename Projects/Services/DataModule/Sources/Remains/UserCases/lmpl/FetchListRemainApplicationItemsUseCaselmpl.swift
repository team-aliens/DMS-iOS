import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchListRemainApplicationItemsUseCaselmpl: FetchListRemainApplicationItemsUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }
    
    public func execute() -> AnyPublisher<DomainModule.ListRemainApplicationItemsEntity, ErrorModule.DmsError> {
        remainsRepository.fetchListRemainApplicationItems()
    }
}
