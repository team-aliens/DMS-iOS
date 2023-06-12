import Combine

public extension FetchMyRemainApplicationItemsResponseDTO {
    func toDomain() -> MyRemainApplicationItemsEntity {
        MyRemainApplicationItemsEntity(
            title: title
        )
    }
}
