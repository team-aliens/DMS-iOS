import Foundation

public enum FilesDomainError: Error {
    case badRequest
    case internalServerError
}

extension FilesDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "badReqest"

        case .internalServerError:
            return "internalServerError"
        }
    }
}
