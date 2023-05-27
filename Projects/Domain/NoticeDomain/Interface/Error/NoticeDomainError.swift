import Foundation

public enum NoticeDomainError: Error {
    case badRequest
    case tokenExpired
    case tooManyRequest
    case internalServerError
    case notFoundSchool
}

extension NoticeDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "요청이 잘못되었습니다."

        case .tokenExpired:
            return "인증이 만료되었습니다. 다시 로그인해주세요!"

        case .tooManyRequest:
            return "요청 횟수를 초과했습니다. 잠시 후 다시 시도해주세요!"

        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 잠시 후 다시 시도해주세요!"

        case .notFoundSchool:
            return "학교를 찾을 수 없습니다."
        }
    }
}
