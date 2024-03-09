import Foundation

public enum OutingDomainError: Error {
    case badRequest
    case tokenExpired
    case forbidden
    case tooManyRequest
    case internalServerError
    case notFound
}

extension OutingDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "요청이 잘못되었습니다."

        case .tokenExpired:
            return "인증이 만료되었습니다. 다시 로그인해주세요."

        case .forbidden:
            return "접근 권한이 없습니다."

        case .tooManyRequest:
            return "요청 횟수를 초과했습니다. 잠시 후 다시 시도해주세요."

        case .internalServerError:
            return "서버에 문제가 발생하였습니다. 잠시 후 다시 시도해주세요."

        case .notFound:
            return "항목을 찾을 수 없습니다."
        }
    }
}