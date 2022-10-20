import Foundation

public struct CheckSchoolAuthCodeResponseDTO: Codable {

    public let schoolID: String

    internal init(schoolID: String) {
        self.schoolID = schoolID
    }

    enum CodingKeys: String, CodingKey {
        case schoolID = "school_id"
    }
}
