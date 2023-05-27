import Foundation

public enum AuthDomainError: Error {
    // verify
    case wrongAuthCode
    case notFoundAuthCode

    // send
    case wrongEmailForm
    case userNotFound
    case existUser

    // reissue
    case notFoundToken

    case internalServerError
}

extension AuthDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongAuthCode:
            return "인증코드를 다시 확인해주세요."
        case .notFoundAuthCode:
            return "해당 메일로 발송된 인증코드가 존재하지 않습니다."
        case .userNotFound:
            return "해당 유저가 존재하지 않습니다."
        case .existUser:
            return "이미 존재하는 계정입니다."
        case .notFoundToken:
            return "토큰을 찾을 수 없습니다."
        case .internalServerError:
            return "인터넷 환경을 확인해주세요."
        case .wrongEmailForm:
            return "@dsm.hs.kr 이 포함되야 합니다."
        }
    }
}
