import DataMappingModule
import DomainModule

public extension CheckSchoolCodeResponseDTO {
    func toDomain() -> CheckSchoolCodeEntity {
        return CheckSchoolCodeEntity(schoolID: schoolID)
    }
}
