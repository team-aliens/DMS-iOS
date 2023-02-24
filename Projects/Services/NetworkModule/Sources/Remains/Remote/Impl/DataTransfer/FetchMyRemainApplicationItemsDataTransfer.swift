import DataMappingModule
import DomainModule

public extension FetchMyRemainApplicationItemsResponseDTO {
    func toDomain() -> MyRemainApplicationItemsEntity {
        MyRemainApplicationItemsEntity(
            title: title
        )
    }
}
