import Combine
import DataMappingModule
import DomainModule
import Foundation
import ErrorModule
import Utility

public struct RemoteNoticeDataSourceStub: RemoteNoticeDataSource {
    public init() {}

    public func fetchWhetherNewNotice() -> AnyPublisher<Bool, DmsError> {
        Just(Bool.random())
            .setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func fetchNoticeList(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], ErrorModule.DmsError> {
        Just([
            NoticeEntity(id: UUID().uuidString, title: "제목1", createdAt: .init().adding(by: .day, value: -2)),
            NoticeEntity(id: UUID().uuidString, title: "제목2", createdAt: .init())
        ])
        .setFailureType(to: DmsError.self)
        .eraseToAnyPublisher()
    }

    public func fetchDetailNotice(id: String) -> AnyPublisher<DetailNoticeEntity, DmsError> {
        Just(DetailNoticeEntity(title: "제목제목", content: "내용내용", createdAt: .init()))
            .setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
