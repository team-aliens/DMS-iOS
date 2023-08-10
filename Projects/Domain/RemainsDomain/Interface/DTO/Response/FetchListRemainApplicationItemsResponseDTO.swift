import Foundation

public struct FetchRemainAppListResponseDTO: Decodable {
    public init(
        remainOptions: [RemainOptionResponseDTO]
    ) {
        self.remainOptions = remainOptions
    }

    public let remainOptions: [RemainOptionResponseDTO]

    enum CodingKeys: String, CodingKey {
        case remainOptions = "remain_options"
    }
}
