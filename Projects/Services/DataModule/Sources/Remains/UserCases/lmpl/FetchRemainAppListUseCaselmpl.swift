import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchRemainAppListUseCaselmpl: FetchRemainApplicationListUseCase {
    private let remainsRepository: any RemainsRepository

    public init(remainsRepository: any RemainsRepository) {
        self.remainsRepository = remainsRepository
    }

    public func execute() -> AnyPublisher<DomainModule.RemainApplicationListEntity, ErrorModule.DmsError> {
        remainsRepository.fetchRemainApplicationList()
    }
}
