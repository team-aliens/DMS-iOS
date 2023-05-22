import Foundation

public struct FetchPresignedURLResponseDTO: Decodable {
    public init(fileUploadURL: String, fileURL: String) {
        self.fileUploadURL = fileUploadURL
        self.fileURL = fileURL
    }

    public let fileUploadURL: String
    public let fileURL: String

    enum CodingKeys: String, CodingKey {
        case fileUploadURL = "file_upload_url"
        case fileURL = "file_url"
    }
}
