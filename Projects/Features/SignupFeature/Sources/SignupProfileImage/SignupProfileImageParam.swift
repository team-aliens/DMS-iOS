import Foundation

public struct SignupProfileImageParam: Equatable {
    public init(
        signupPasswordParam: SignupPasswordParam,
        password: String
    ) {
        self.schoolCode = signupPasswordParam.schoolCode
        self.schoolID = signupPasswordParam.schoolID
        self.schoolAnswer = signupPasswordParam.schoolAnswer
        self.email = signupPasswordParam.email
        self.authCode = signupPasswordParam.authCode
        self.grade = signupPasswordParam.grade
        self.class = signupPasswordParam.class
        self.number = signupPasswordParam.number
        self.accountID = signupPasswordParam.accountID
        self.password = password
    }

    public let schoolCode: String
    public let schoolID: String
    public let schoolAnswer: String
    public let email: String
    public let authCode: String
    public let grade: Int
    public let `class`: Int
    public let number: Int
    public let accountID: String
    public let password: String
}
