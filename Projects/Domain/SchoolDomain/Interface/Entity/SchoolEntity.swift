import Foundation

public struct SchoolEntity: Equatable, Identifiable {
    public let id: String
    public let name: String
    public let address: String

    public init(id: String, name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }
}
