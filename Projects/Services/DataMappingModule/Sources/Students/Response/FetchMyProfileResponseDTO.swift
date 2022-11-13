import Foundation

public struct FetchMyProfileResponseDTO: Decodable {
    public let schoolName: String
    public let name: String
    public let gcn: String
    public let profileImageURL: URL
    public let bonusPoint: Int
    public let minusPoint: Int
    public let phrase: String

    public init(
        schoolName: String,
        name: String,
        gcn: String,
        profileImageURL: URL,
        bonusPoint: Int,
        minusPoint: Int,
        phrase: String
    ) {
        self.schoolName = schoolName
        self.name = name
        self.gcn = gcn
        self.profileImageURL = profileImageURL
        self.bonusPoint = bonusPoint
        self.minusPoint = minusPoint
        self.phrase = phrase
    }

    public enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case bonusPoint = "bonus_point"
        case minusPoint = "minus_point"
        case profileImageURL = "profile_image_url"
        case name, gcn, phrase
    }
}
