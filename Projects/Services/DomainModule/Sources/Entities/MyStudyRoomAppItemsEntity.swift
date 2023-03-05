import Foundation

public struct MyStudyRoomAppItemsEntity: Equatable, Hashable {
    public init(floor: Int, name: String) {
        self.floor = floor
        self.name = name
    }

    public let floor: Int
    public let name: String
}
