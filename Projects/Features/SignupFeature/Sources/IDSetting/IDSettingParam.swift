import Foundation

public struct IDSettingParam: Equatable {
    public init(
        signupEmailAuthCodeVerifyParam: SignupEmailAuthCodeVerifyParam,
        authCode: String
    ) {
        self.schoolCode = signupEmailAuthCodeVerifyParam.schoolCode
        self.schoolID = signupEmailAuthCodeVerifyParam.schoolID
        self.schoolAnswer = signupEmailAuthCodeVerifyParam.schoolAnswer
        self.email = signupEmailAuthCodeVerifyParam.email
        self.authCode = authCode
    }

    public let schoolCode: String
    public let schoolID: String
    public let schoolAnswer: String
    public let email: String
    public let authCode: String
}
