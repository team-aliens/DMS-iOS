import Foundation

public struct SignupRequestDTO: Encodable {
    public let schoolCode: String
    public let schoolAnswer: String
    public let email: String
    public let authCode: String
    public let grade: Int
    public let classRoom: Int
    public let number: Int
    public let accountID: String
    public let password: String
    public let profileImageUrl: String?

    public init(schoolCode: String,
                schoolAnswer: String,
                email: String,
                authCode: String,
                grade: Int,
                classRoom: Int,
                number: Int,
                accountID: String,
                password: String,
                profileImageUrl: String?) {
        self.schoolCode = schoolCode
        self.schoolAnswer = schoolAnswer
        self.email = email
        self.authCode = authCode
        self.grade = grade
        self.classRoom = classRoom
        self.number = number
        self.accountID = accountID
        self.password = password
        self.profileImageUrl = profileImageUrl
    }

    enum CodingKeys: String, CodingKey {
        case schoolCode = "school_code"
        case schoolAnswer = "school_answer"
        case authCode = "auth_code"
        case classRoom = "class_room"
        case accountID = "account_id"
        case profileImageUrl = "profile_image_url"
        case email, grade, number, password
    }
}
