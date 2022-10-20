import DataMappingModule
import DomainModule

public extension SingleSchoolResponseDTO {
    func toDomain() -> SchoolEntity {
        return SchoolEntity(
            id: id,
            name: name,
            address: address
        )
    }
}
