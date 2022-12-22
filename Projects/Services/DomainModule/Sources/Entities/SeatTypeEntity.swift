import Foundation

public struct SeatTypeEntity: Equatable, Decodable {
    public init(id: String, name: String, color: String) {
        self.id = id
        self.name = name
        self.color = color
    }

    public let id: String
    public let name: String
    public let color: String
}
