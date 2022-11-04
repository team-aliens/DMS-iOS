import Foundation

public struct FetchWhetherNewNoticeResponseDTO: Decodable {
    public init(whetherNewNotice: Bool) {
        self.whetherNewNotice = whetherNewNotice
    }

    public let whetherNewNotice: Bool

    enum CodingKeys: String, CodingKey {
        case whetherNewNotice = "whether_new_notice"
    }
}
