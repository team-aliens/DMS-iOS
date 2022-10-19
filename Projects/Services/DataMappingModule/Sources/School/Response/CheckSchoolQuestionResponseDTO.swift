import Foundation

public struct CheckSchoolQuestionResponseDTO: Codable {

    public let question: String

    internal init(question: String) {
        self.question = question
    }
}
