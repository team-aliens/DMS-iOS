import Foundation

public struct StudyRoomEntity: Equatable, Hashable {
    public init(
        id: String,
        floor: Int,
        name: String,
        availableGrade: Int,
        availableSex: AvailableSexType,
        inUseHeadcount: Int,
        totalAvailableSeat: Int,
        isMine: Bool
    ) {
        self.id = id
        self.floor = floor
        self.name = name
        self.availableGrade = availableGrade
        self.availableSex = availableSex
        self.inUseHeadcount = inUseHeadcount
        self.totalAvailableSeat = totalAvailableSeat
        self.isMine = isMine
    }

    public let id: String
    public let floor: Int
    public let name: String
    public let availableGrade: Int
    public let availableSex: AvailableSexType
    public let inUseHeadcount: Int
    public let totalAvailableSeat: Int
    public let isMine: Bool
}
