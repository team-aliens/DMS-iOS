import Combine

public protocol FetchRemainApplicationListUseCase {
    func execute() -> AnyPublisher<RemainApplicationListEntity, Error>
}
