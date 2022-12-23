import DataMappingModule
import DomainModule

public extension FetchDetailStudyRoomResponseDTO {
    func toDomain() -> DetailStudyRoomEntity {
        DetailStudyRoomEntity(
            floor: floor,
            name: name,
            totalAvailableSeat: totalAvailableSeat,
            inUseHeadcount: inUseHeadcount,
            availableSex: availableSex,
            availableGrade: availableGrade,
            eastDescription: eastDescription,
            westDescription: westDescription,
            southDescription: southDescription,
            northDescription: northDescription,
            totalWidthSize: totalAvailableSeat,
            totalHeightSize: totalHeightSize,
            seats: seats.map { $0.toDomain() }
        )
    }
}

public extension SeatResponseDTO {
    func toDomain() -> SeatEntity {
        SeatEntity(
            id: id,
            widthLocation: widthLocation,
            heightLocation: heightLocation,
            number: number,
            type: type?.toDomain(),
            status: status,
            isMine: isMine,
            student: student?.toDomain()
        )
    }
}

public extension SeatStudentResponseDTO {
    func toDomain() -> SeatStudentEntity {
        SeatStudentEntity(
            id: id,
            name: name
        )
    }
}
