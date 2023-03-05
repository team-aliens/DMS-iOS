import Foundation

public struct FindIDRequestDTO {
    public let schoolID: String
    public let name: String
    public let grade: Int
    public let classRoom: Int
    public let number: Int

    public init(schoolID: String,
                name: String,
                grade: Int,
                classRoom: Int,
                number: Int) {
        self.schoolID = schoolID
        self.name = name
        self.grade = grade
        self.classRoom = classRoom
        self.number = number
    }
}
