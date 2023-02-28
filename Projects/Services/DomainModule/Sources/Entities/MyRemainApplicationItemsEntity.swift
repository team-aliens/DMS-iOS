import Foundation

public struct MyRemainApplicationItemsEntity: Equatable, Hashable {
    public init(title: String) {
        self.title = title
    }
    public var title: String
}
