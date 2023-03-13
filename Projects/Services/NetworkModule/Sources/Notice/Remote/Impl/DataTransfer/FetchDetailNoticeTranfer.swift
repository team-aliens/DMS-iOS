import DataMappingModule
import DomainModule
import Utility

public extension FetchDetailNoticeResponseDTO {
    func toDomain() -> DetailNoticeEntity {
        DetailNoticeEntity(
            title: title,
            content: content,
            createdAt: createdAt.toDMSNoticeDate()
        )
    }
}
