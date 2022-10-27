import Foundation

public struct SignupEmailAuthCodeVerifyParam: Equatable {
    public init(schoolCode: String, schoolAnswer: String, email: String) {
        self.schoolCode = schoolCode
        self.schoolAnswer = schoolAnswer
        self.email = email
    }

    public let schoolCode: String
    public let schoolAnswer: String
    public let email: String
}
