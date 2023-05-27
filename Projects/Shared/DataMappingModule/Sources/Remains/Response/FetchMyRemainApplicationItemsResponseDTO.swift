import Foundation

public struct FetchMyRemainApplicationItemsResponseDTO: Decodable {
    public init(
        title: String
    ) {
        self.title = title
    }

    public let title: String
}
