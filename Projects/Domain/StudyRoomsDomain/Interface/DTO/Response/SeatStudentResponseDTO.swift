import Foundation

public struct SeatStudentResponseDTO: Decodable {
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    public let id: String
    public let name: String
}
