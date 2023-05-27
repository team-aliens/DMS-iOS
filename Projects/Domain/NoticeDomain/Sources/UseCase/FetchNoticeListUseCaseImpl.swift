import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchNoticeListUseCaseImpl: FetchNoticeListUseCase {
    private let noticeRepository: any NoticeRepository

    public init(noticeRepository: any NoticeRepository) {
        self.noticeRepository = noticeRepository
    }

    public func execute(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], Error> {
        noticeRepository.fetchNoticeList(order: order)
    }
}
