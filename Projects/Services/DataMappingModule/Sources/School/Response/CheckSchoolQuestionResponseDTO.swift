import Foundation

public struct CheckSchoolQuestionResponseDTO: Codable {

    public let question: String

    public init(question: String) {
        self.question = question
    }
}
