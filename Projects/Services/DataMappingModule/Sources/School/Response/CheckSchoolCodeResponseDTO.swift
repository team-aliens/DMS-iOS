import Foundation

public struct CheckSchoolCodeResponseDTO: Codable {

    public let schoolID: String

    public init(schoolID: String) {
        self.schoolID = schoolID
    }

    enum CodingKeys: String, CodingKey {
        case schoolID = "school_id"
    }
}
