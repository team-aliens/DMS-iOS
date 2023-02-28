import Foundation

public struct FehtchMyStudyRoomApplicationItemsDTO: Decodable {
    public init(floor: String, name: String) {
        self.floor = floor
        self.name = name
    }
    public let floor: String
    public let name: String
}
