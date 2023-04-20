import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchDetailNoticeUseCaseImpl: FetchDetailNoticeUseCase {
    private let noticeRepository: any NoticeRepository

    public init(noticeRepository: any NoticeRepository) {
        self.noticeRepository = noticeRepository
    }

    public func execute(id: String) -> AnyPublisher<DetailNoticeEntity, DmsError> {
        noticeRepository.fetchDetailNotice(id: id)
    }
}
