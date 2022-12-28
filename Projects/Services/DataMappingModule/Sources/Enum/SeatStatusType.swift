import Foundation

public enum SeatStatusType: String, Decodable {
    case available = "AVAILABLE"
    case unavailable = "UNAVAILABLE"
    case inUse = "IN_USE"
    case empty = "EMPTY"
}
