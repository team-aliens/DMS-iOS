import Foundation

public extension FetchStudyAvailableTimeResponseDTO {
    func toDomain() -> StudyAvailableTimeEntity {
        StudyAvailableTimeEntity(
            startAt: startAt,
            endAt: endAt
        )
    }
}
