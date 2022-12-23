import Foundation

public struct FetchStudyAvailableTimeResponseDTO: Decodable {
    public init(startAt: String, endAt: String) {
        self.startAt = startAt
        self.endAt = endAt
    }

    public let startAt: String
    public let endAt: String

    enum CodingKeys: String, CodingKey {
        case startAt = "start_at"
        case endAt = "end_at"
    }
}
