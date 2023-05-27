import Foundation

public enum UsersDomainError: Error {
    case badRequest
    case tokenExpired
    case tooManyRequest
    case internalServerError
    case notFoundAuthInfo
    case authCodeMismatch
    case currentPasswordMismatch
}

extension UsersDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "요청이 잘못되었습니다."

        case .tokenExpired:
            return "인증이 만료되었습니다. 다시 로그인해주세요!"

        case .tooManyRequest:
            return "요청 횟수를 초과했습니다. 잠시 후 다시 시도해주세요!"

        case .notFoundAuthInfo:
            return "인증 정보를 찾을 수 없습니다."

        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 잠시 후 다시 시도해주세요!"

        case .authCodeMismatch:
            return "인증코드가 일치하지 않습니다."

        case .currentPasswordMismatch:
            return "유효하지 않은 비밀번호입니다."
        }
    }
}
