import Foundation

public struct SingleSchoolResponseDTO: Codable {
    public let id: String
    public let name: String
    public let address: String

    internal init(id: String, name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }
}
