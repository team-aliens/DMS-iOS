import DataMappingModule
import DomainModule

public extension FetchListRemainAppItemsResponseDTO {
    func toDomain() -> ListRemainApplicationItemEntity {
        ListRemainApplicationItemEntity(
            selectedOption: selectedOption,
            remainOptions: remainOptions.map { $0.toDomain() }
        )
    }
}

public extension RemainOptionResponseDTO {
    func toDomain() -> RemainOptionEntity {
        RemainOptionEntity(
            id: id,
            title: title,
            description: description
        )
    }
}
