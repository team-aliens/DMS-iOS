import Foundation

public struct SchoolConfirmationQuestionsParam: Equatable {
    public let schoolCode: String
    public let schoolID: String

    public init(schoolCode: String, schoolID: String) {
        self.schoolCode = schoolCode
        self.schoolID = schoolID
    }
}
