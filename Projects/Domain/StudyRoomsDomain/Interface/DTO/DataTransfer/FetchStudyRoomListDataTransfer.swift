import Foundation

public extension FetchStudyRoomListResponDTO {
    func toDomain() -> [StudyRoomEntity] {
        studyRooms.map { $0.toDomain() }
    }
}

public extension SingleStudyRoomResponseDTO {
    func toDomain() -> StudyRoomEntity {
        StudyRoomEntity(
            id: id,
            floor: floor,
            name: name,
            availableGrade: availableGrade,
            availableSex: availableSex,
            inUseHeadcount: inUseHeadcount,
            totalAvailableSeat: totalAvailableSeat,
            isMine: isMine
        )
    }
}
