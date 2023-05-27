import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchWhetherNewNoticeUseCaseImpl: FetchWhetherNewNoticeUseCase {
    private let noticeRepository: any NoticeRepository

    public init(noticeRepository: any NoticeRepository) {
        self.noticeRepository = noticeRepository
    }

    public func execute() -> AnyPublisher<Bool, Error> {
        noticeRepository.fetchWhetherNewNotice()
    }
}
