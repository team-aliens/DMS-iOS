import Foundation

public enum SeatStatusType: String, Decodable {
    case available = "AVAILABLE"
    case unavailable = "UNAVAILABLE"
    case empty = "EMPTY"
}
