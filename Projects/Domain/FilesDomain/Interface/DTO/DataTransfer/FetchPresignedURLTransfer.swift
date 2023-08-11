import Foundation
import Combine

public extension FetchPresignedURLResponseDTO {
    func toDomain() -> PresignedURLEntity {
        PresignedURLEntity(
            fileUploadURL: fileUploadURL,
            fileURL: fileURL
        )
    }
}
