import DataMappingModule
import DomainModule

public extension FehtchMyStudyRoomApplicationItemsDTO {
    func toDomain() -> MyStudyRoomAppItemsEntity {
        MyStudyRoomAppItemsEntity(
            floor: floor,
            name: name
        )
    }
}
