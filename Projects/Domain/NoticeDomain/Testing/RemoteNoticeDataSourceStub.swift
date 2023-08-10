import NoticeDomainInterface
import Foundation
import Combine
import UtilityModule

public struct RemoteNoticeDataSourceStub: RemoteNoticeDataSource {
    public init() {}

    public func fetchWhetherNewNotice() -> AnyPublisher<Bool, Error> {
        Just(Bool.random())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    public func fetchNoticeList(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], Error> {
        Just([
            NoticeEntity(id: UUID().uuidString, title: "제목2", createdAt: .init())
        ])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }

    public func fetchDetailNotice(id: String) -> AnyPublisher<DetailNoticeEntity, Error> {
        Just(DetailNoticeEntity(title: "제목제목", content: "내용내용", createdAt: .init()))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
