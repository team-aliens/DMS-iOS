import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchRemainAppListUseCaseImpl: FetchRemainApplicationListUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }

    public func execute() -> AnyPublisher<RemainApplicationListEntity, Error> {
        remainsRepository.fetchRemainApplicationList()
    }
}
