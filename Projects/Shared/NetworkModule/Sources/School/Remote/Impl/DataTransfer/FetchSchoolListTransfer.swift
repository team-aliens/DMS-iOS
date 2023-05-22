import DataMappingModule
import DomainModule

public extension FetchSchoolListResponseDTO {
    func toDomain() -> [SchoolEntity] {
        return schools.map { $0.toDomain() }
    }
}
