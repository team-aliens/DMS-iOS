import Combine

public protocol FetchDetailNoticeUseCase {
    func execute(id: String) -> AnyPublisher<DetailNoticeEntity, Error>
}
