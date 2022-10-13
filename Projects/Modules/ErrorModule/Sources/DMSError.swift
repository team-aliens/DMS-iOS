import Foundation

public enum DMSError: Error {
    case unknown
    case custom(message: String, code: Int)
}

public extension Error {
    var asDMSError: DMSError {
        self as? DMSError ?? .unknown
    }
}
