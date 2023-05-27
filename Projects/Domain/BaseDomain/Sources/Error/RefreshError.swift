import Foundation

public enum RefreshError: Error {
    case unauthorized
}

extension RefreshError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "Unauthorized"
        }
    }
}
