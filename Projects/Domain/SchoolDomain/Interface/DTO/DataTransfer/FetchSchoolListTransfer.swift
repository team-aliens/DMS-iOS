import Foundation

public extension FetchSchoolListResponseDTO {
    func toDomain() -> [SchoolEntity] {
        return schools.map { $0.toDomain() }
    }
}
