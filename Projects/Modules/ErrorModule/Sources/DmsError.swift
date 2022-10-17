import Foundation

public enum DmsError: Error {
    case unknown
    case custom(message: String = "알 수 없는 오류가 발생하였습니다", code: Int = 500)
    case badRequest
    case tokenExpired
    
    // MARK: - Auth
    case passwordMismatch
    case notFoundUserBySignin
}

extension DmsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "알 수 없는 오류가 발생하였습니다"

        case let .custom(message, _):
            return message

        case .badRequest:
            return "요청이 잘못되었습니다"

        case .tokenExpired:
            return "인증이 만료되었습니다. 다시 로그인해주세요!"

        case .passwordMismatch, .notFoundUserBySignin:
            return "아이디 또는 비밀번호를 확인해주세요"
        }
    }
}

public extension Error {
    var asDMSError: DmsError {
        self as? DmsError ?? .unknown
    }
}
