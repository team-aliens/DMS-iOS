import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchListRemainAppItemsUseCaselmpl: FetchListRemainApplicationItemUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }

    public func execute() -> AnyPublisher<DomainModule.ListRemainApplicationItemEntity, ErrorModule.DmsError> {
        remainsRepository.fetchListRemainApplicationItem()
    }
}
