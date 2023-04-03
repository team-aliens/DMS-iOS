import DataMappingModule
import DomainModule
import Utility

public extension FetchPresignedURLResponseDTO {
    func toDomain() -> PresignedURLEntity {
        PresignedURLEntity(
            fileUploadURL: fileUploadURL,
            fileURL: fileURL
        )
    }
}
