import Foundation

public struct SingleStudyRoomResponseDTO: Decodable {
    public init(
        id: String,
        floor: Int,
        name: String,
        availableGrade: Int,
        availableSex: String,
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
    public let availableSex: String
    public let inUseHeadcount: Int
    public let totalAvailableSeat: Int
    public let isMine: Bool

    enum CodingKeys: String, CodingKey {
        case id, floor, name
        case availableGrade = "available_grade"
        case availableSex = "available_sex"
        case inUseHeadcount = "in_use_headcount"
        case totalAvailableSeat = "total_available_seat"
        case isMine = "is_mine"
    }
}
