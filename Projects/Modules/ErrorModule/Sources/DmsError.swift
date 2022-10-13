import Foundation

public enum DmsError: Error {
    case unknown
    case custom(message: String, code: Int)
}

extension DmsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "알 수 없는 오류가 발생하였습니다"

        case let .custom(message, _):
            return message
        }
    }
}

public extension Error {
    var asDMSError: DmsError {
        self as? DmsError ?? .unknown
    }
}
