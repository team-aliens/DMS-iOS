import Foundation
import DataMappingModule

public struct DetailStudyRoomEntity: Equatable {
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
        seats: [SeatEntity]
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
    public let seats: [SeatEntity]
}
