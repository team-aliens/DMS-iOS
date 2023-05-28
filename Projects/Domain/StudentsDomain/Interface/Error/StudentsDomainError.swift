import Foundation

public enum StudentsDomainError: Error {
    case badRequest
    case tokenExpired
    case tooManyRequest
    case internalServerError
    case notFoundAuthInfo
    case unAuthorizedEmail
    case alreadyExistUserBySignup
    case alreadyExistIDByCheckID
    case alreadyExistEmailByCheckEmail
    case invalidStudentInfoByFindID
    case notFoundStudentByFindID
    case notFoundGradeClassNumber
    case mismatchEmailAndName
    case failedToWithdrawal
}

extension StudentsDomainError: LocalizedError {
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

        case .notFoundAuthInfo:
            return "인증 정보를 찾을 수 없습니다."

        case .unAuthorizedEmail:
            return "이메일이 인증되지 않았습니다."

        case .alreadyExistUserBySignup:
            return "이미 회원가입한 학생합니다!"

        case .alreadyExistIDByCheckID:
            return "이미 존재하는 아이디입니다."

        case .alreadyExistEmailByCheckEmail:
            return "이미 존재하는 이메일입니다."

        case .invalidStudentInfoByFindID:
            return "이름과 학번이 일치하는 계정이 존재하지 않습니다."

        case .notFoundStudentByFindID:
            return "이름과 학번이 일치하는 계정이 존재하지 않습니다."

        case .notFoundGradeClassNumber:
            return "학번을 확인해주세요."

        case .mismatchEmailAndName:
            return "이름과 이메일이 일치하는 학생을 찾을 수 없습니다."

        case .failedToWithdrawal:
            return "회원탈퇴에 실패했습니다. 잠시 후 다시 시도해주세요."
        }
    }
}
