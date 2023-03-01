import DataMappingModule
import DomainModule
import Foundation

public extension FetchMyProfileResponseDTO {
    func toDomain() -> MyProfileEntity {
        MyProfileEntity(
            schoolName: schoolName,
            name: name,
            gcn: gcn,
            profileImageURL: URL(string: profileImageURL),
            sex: sex,
            bonusPoint: bonusPoint,
            minusPoint: minusPoint,
            phrase: phrase
        )
    }
}
