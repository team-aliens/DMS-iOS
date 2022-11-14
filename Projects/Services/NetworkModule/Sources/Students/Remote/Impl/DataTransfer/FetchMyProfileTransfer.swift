import DataMappingModule
import DomainModule

public extension FetchMyProfileResponseDTO {
    func toDomain() -> MyProfileEntity {
        MyProfileEntity(
            schoolName: schoolName,
            name: name,
            gcn: gcn,
            profileImageURL: profileImageURL,
            bonusPoint: bonusPoint,
            minusPoint: minusPoint,
            phrase: phrase
        )
    }
}
