import Combine
import RemainsDomainInterface

public struct FetchMyRemainApplicationItemsUseCaseImpl: FetchMyRemainApplicationItemsUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }

    public func execute() -> AnyPublisher<MyRemainApplicationItemsEntity, Error> {
        remainsRepository.fetchMyRemainApplicationItems()
    }
}
