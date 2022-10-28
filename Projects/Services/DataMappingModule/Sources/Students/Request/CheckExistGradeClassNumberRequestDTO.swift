import Foundation

public struct CheckExistGradeClassNumberRequestDTO {
    public init(schoolID: String, grade: Int, `class`: Int, number: Int) {
        self.schoolID = schoolID
        self.grade = grade
        self.`class` = `class`
        self.number = number
    }

    public let schoolID: String
    public let grade: Int
    public let `class`: Int
    public let number: Int
}
