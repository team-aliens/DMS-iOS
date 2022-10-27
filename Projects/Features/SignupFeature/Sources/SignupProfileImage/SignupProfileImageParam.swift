import Foundation

public struct SignupProfileImageParam: Equatable {
    public init(
        schoolCode: String,
        schoolAnswer: String,
        email: String,
        grade: Int,
        classRoom: Int,
        number: Int,
        accountID: String,
        password: String
    ) {
        self.schoolCode = schoolCode
        self.schoolAnswer = schoolAnswer
        self.email = email
        self.grade = grade
        self.classRoom = classRoom
        self.number = number
        self.accountID = accountID
        self.password = password
    }

    public let schoolCode: String
    public let schoolAnswer: String
    public let email: String
    public let grade: Int
    public let classRoom: Int
    public let number: Int
    public let accountID: String
    public let password: String
}
