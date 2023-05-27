import Foundation

public enum PointsDomainError: Error {
    case badRequest
    case internalServerError
}

extension PointsDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "요청이 잘못되었습니다."

        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 잠시 후 다시 시도해주세요!"
        }
    }
}

