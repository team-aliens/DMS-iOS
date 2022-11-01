import Foundation

public struct SignupPasswordParam: Equatable {
    public init(
        idSettingParam: IDSettingParam,
        grade: Int,
        `class`: Int,
        number: Int,
        accountID: String
    ) {
        self.schoolCode = idSettingParam.schoolCode
        self.schoolID = idSettingParam.schoolID
        self.schoolAnswer = idSettingParam.schoolAnswer
        self.email = idSettingParam.email
        self.authCode = idSettingParam.authCode
        self.grade = grade
        self.class = `class`
        self.number = number
        self.accountID = accountID
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
}
