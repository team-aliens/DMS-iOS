import Foundation
import DataMappingModule

public struct SeatEntity: Equatable, Hashable {
    public init(
        id: String,
        widthLocation: Int,
        heightLocation: Int,
        number: Int? = nil,
        type: SeatTypeEntity? = nil,
        status: SeatStatusType,
        isMine: Bool? = nil,
        student: SeatStudentEntity? = nil
    ) {
        self.id = id
        self.widthLocation = widthLocation
        self.heightLocation = heightLocation
        self.number = number
        self.type = type
        self.status = status
        self.isMine = isMine
        self.student = student
    }

    public let id: String
    public let widthLocation, heightLocation: Int
    public let number: Int?
    public let type: SeatTypeEntity?
    public let status: SeatStatusType
    public let isMine: Bool?
    public let student: SeatStudentEntity?
}
