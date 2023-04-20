import Foundation

public struct UploadFileResponseDTO: Decodable {
    public let fileURL: String

    enum CodingKeys: String, CodingKey {
        case fileURL = "file_url"
    }
}
