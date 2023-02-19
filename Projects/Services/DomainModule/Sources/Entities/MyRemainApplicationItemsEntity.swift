import Foundation

public struct MyRemainApplicationItemsEntity: Equatable, Hashable {
    public init(
        title: String
    ) {
        self.title = title
    }
    public let title: String
}
