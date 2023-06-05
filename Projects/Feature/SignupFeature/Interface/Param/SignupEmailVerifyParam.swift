import Foundation

public struct SignupEmailVerifyParam: Equatable {
    public init(
        schoolConfirmationQuestionsParam: SchoolConfirmationQuestionsParam,
        schoolAnswer: String
    ) {
        self.schoolCode = schoolConfirmationQuestionsParam.schoolCode
        self.schoolID = schoolConfirmationQuestionsParam.schoolID
        self.schoolAnswer = schoolAnswer
    }

    public let schoolCode: String
    public let schoolID: String
    public let schoolAnswer: String
}
