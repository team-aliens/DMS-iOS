import Foundation

public struct SignupTermsParam: Equatable {
    public init(
        signupProfileImageParam: SignupProfileImageParam,
        profileImageURLString: String?
    ) {
        self.schoolCode = signupProfileImageParam.schoolCode
        self.schoolAnswer = signupProfileImageParam.schoolAnswer
        self.email = signupProfileImageParam.email
        self.authCode = signupProfileImageParam.authCode
        self.grade = signupProfileImageParam.grade
        self.class = signupProfileImageParam.class
        self.number = signupProfileImageParam.number
        self.accountID = signupProfileImageParam.accountID
        self.password = signupProfileImageParam.password
        self.profileImageURLString = profileImageURLString
    }

    public let schoolCode: String
    public let schoolAnswer: String
    public let email: String
    public let authCode: String
    public let grade: Int
    public let `class`: Int
    public let number: Int
    public let accountID: String
    public let password: String
    public let profileImageURLString: String?
}
