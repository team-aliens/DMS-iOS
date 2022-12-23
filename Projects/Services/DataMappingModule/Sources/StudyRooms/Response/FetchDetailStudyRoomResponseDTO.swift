import Foundation

public struct FetchDetailStudyRoomResponseDTO: Decodable {
    public init(
        floor: Int,
        name: String,
        totalAvailableSeat: Int,
        inUseHeadcount: Int,
        availableSex: AvailableSexType,
        availableGrade: Int,
        eastDescription: String,
        westDescription: String,
        southDescription: String,
        northDescription: String,
        totalWidthSize: Int,
        totalHeightSize: Int,
        seats: [SeatResponseDTO]
    ) {
        self.floor = floor
        self.name = name
        self.totalAvailableSeat = totalAvailableSeat
        self.inUseHeadcount = inUseHeadcount
        self.availableSex = availableSex
        self.availableGrade = availableGrade
        self.eastDescription = eastDescription
        self.westDescription = westDescription
        self.southDescription = southDescription
        self.northDescription = northDescription
        self.totalWidthSize = totalWidthSize
        self.totalHeightSize = totalHeightSize
        self.seats = seats
    }

    public let floor: Int
    public let name: String
    public let totalAvailableSeat: Int
    public let inUseHeadcount: Int
    public let availableSex: AvailableSexType
    public let availableGrade: Int
    public let eastDescription: String
    public let westDescription: String
    public let southDescription: String
    public let northDescription: String
    public let totalWidthSize: Int
    public let totalHeightSize: Int
    public let seats: [SeatResponseDTO]

    enum CodingKeys: String, CodingKey {
        case floor, name, seats
        case totalAvailableSeat = "total_available_seat"
        case inUseHeadcount = "in_use_headcount"
        case availableSex = "available_sex"
        case availableGrade = "available_grade"
        case eastDescription = "east_description"
        case westDescription = "west_description"
        case southDescription = "south_description"
        case northDescription = "north_description"
        case totalWidthSize = "total_width_size"
        case totalHeightSize = "total_height_size"
    }
}
