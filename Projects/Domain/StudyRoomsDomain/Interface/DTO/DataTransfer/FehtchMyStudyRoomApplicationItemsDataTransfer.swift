import Foundation

public extension FetchMyStudyRoomApplicationItemsDTO {
    func toDomain() -> MyStudyRoomAppItemsEntity {
        MyStudyRoomAppItemsEntity(
            floor: floor,
            name: name
        )
    }
}
