import Foundation

public struct CheckExistGradeClassNumberResponseDTO: Decodable {
    public init(name: String) {
        self.name = name
    }

    public let name: String
}
