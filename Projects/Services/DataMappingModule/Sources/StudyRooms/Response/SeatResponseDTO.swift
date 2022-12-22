import Foundation

public struct SeatResponseDTO: Decodable {
    public init(
        id: String,
        widthLocation: Int,
        heightLocation: Int,
        number: Int? = nil,
        type: SingleSeatTypeResponseDTO? = nil,
        status: SeatStatusType,
        isMine: Bool? = nil,
        student: SeatStudentResponseDTO? = nil
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
    public let widthLocation: Int
    public let heightLocation: Int
    public let number: Int?
    public let type: SingleSeatTypeResponseDTO?
    public let status: SeatStatusType
    public let isMine: Bool?
    public let student: SeatStudentResponseDTO?

    enum CodingKeys: String, CodingKey {
        case id, number, type, status, student
        case widthLocation = "width_location"
        case heightLocation = "height_location"
        case isMine = "is_mine"
    }
}
