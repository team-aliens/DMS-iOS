import Foundation

public struct FetchNoticeListResponseDTO: Decodable {
    public let notices: [SingleNoticeResponseDTO]
}
