import Foundation

public struct PresignedURLEntity: Equatable, Hashable {
    public init(
        fileUploadURL: String,
        fileURL: String
    ) {
        self.fileUploadURL = fileUploadURL
        self.fileURL = fileURL
    }

    public let fileUploadURL: String
    public let fileURL: String
}
