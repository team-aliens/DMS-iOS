import Foundation

public struct RemainOptionResponseDTO: Decodable {
    public init(
        id: String,
        title: String,
        description: String
    ) {
        self.id = id
        self.title = title
        self.description = description
    }
    public let id: String
    public let title: String
    public let description: String
}
