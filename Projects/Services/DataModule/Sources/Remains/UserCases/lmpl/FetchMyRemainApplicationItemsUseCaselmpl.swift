import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchMyRemainApplicationItemsUseCaselmpl: FetchMyRemainApplicationItemsUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }

    public func execute() -> AnyPublisher<MyRemainApplicationItemsEntity, DmsError> {
        remainsRepository.fetchMyRemainApplicationItems()
    }
}
