import Foundation

public struct SignupEmailAuthCodeVerifyParam: Equatable {
    public init(
        signupEmailVerifyParam: SignupEmailVerifyParam,
        email: String
    ) {
        self.schoolCode = signupEmailVerifyParam.schoolCode
        self.schoolID = signupEmailVerifyParam.schoolID
        self.schoolAnswer = signupEmailVerifyParam.schoolAnswer
        self.email = email
    }

    public let schoolCode: String
    public let schoolID: String
    public let schoolAnswer: String
    public let email: String
}
