import Foundation

public enum DmsError: Error {
    case unknown
    case custom(message: String = "알 수 없는 오류가 발생하였습니다", code: Int = 500)
    case badRequest
    case tokenExpired
    case tooManyRequest
    case internalServerError

    // MARK: VerifyAuthCode
    case authCodeMismatch
    case notFoundAuthInfo

    // MARK: - Auth
    case notFoundRoomStudent

    // MARK: Signin
    case passwordMismatch
    case notFoundUserBySignin

    // MARK: emailExistByAccountID
    case diffrentEmailByAccountID
    case notFoundAccountID

    // MARK: - Students
    case unAuthorizedEmail
    case alreadyExistUserBySignup
    case alreadyExistIDByCheckID
    case alreadyExistEmailByCheckEmail
    case invalidStudentInfoByFindID
    case notFoundStudentByFindID
    case notFoundGradeClassNumber
    case mismatchEmailAndName

    // MARK: - School
    case notFoundSchool
    case invalidQuestionAnswer

    // MARK: - Users
    case currentPasswordMismatch
    case photoCapacityIsLarge
    case failedToWithdrawal

    // MARK: - StudyRooms
    case seatIsAlreadyExist
    case notFoundAppliedSeat
    case noPermissionApplyTime
    case unavailableSex

    // MARK: - Remains
    case forbiddenRemainPeriod
    case notFoundRemain
    case conflictRemain
}

extension DmsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "알 수 없는 오류가 발생하였습니다."

        case let .custom(message, _):
            return message

        case .badRequest:
            return "요청이 잘못되었습니다."

        case .tokenExpired:
            return "인증이 만료되었습니다. 다시 로그인해주세요!"

        case .tooManyRequest:
            return "요청 횟수를 초과했습니다. 잠시 후 다시 시도해주세요!"

        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 잠시 후 다시 시도해주세요!"

        // MARK: - Auth

        case .passwordMismatch, .notFoundUserBySignin:
            return "아이디 또는 비밀번호를 확인해주세요."

        case .authCodeMismatch:
            return "인증코드가 일치하지 않습니다."

        case .notFoundAuthInfo:
            return "인증 정보를 찾을 수 없습니다."

        case .diffrentEmailByAccountID:
            return "아이디와 이메일이 일치하지 않습니다."

        case .notFoundAccountID:
            return "존재하지 않는 아이디입니다."

        case .notFoundRoomStudent:
            return "학생이 등록되지 않았습니다."

        // MARK: - Students
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

        // MARK: - School
        case .notFoundSchool:
            return "학교를 찾을 수 없습니다."

        case .invalidQuestionAnswer:
            return "질문에 대한 답변이 일치하지 않습니다."

        // MARK: - Users
        case .currentPasswordMismatch:
            return "유효하지 않은 비밀번호입니다."

        case .photoCapacityIsLarge:
            return "사진의 최대 용량을 초과했습니다."

        case .failedToWithdrawal:
            return "회원탈퇴에 실패했습니다. 잠시 후 다시 시도해주세요."

        // MARK: - StudyRooms
        case .seatIsAlreadyExist:
            return "이미 신청된 자리입니다"

        case .notFoundAppliedSeat:
            return "신청한 자리가 없습니다"

        case .noPermissionApplyTime:
            return "신청 불가능한 시간대입니다"

        case .unavailableSex:
            return "신청할 수 없는 학년 혹은 성별입니다"

        // MARK: - Remains
        case .forbiddenRemainPeriod:
            return "잔류 신청 기간이 아닙니다"

        case .notFoundRemain:
            return "찾을 수 없습니다"

        case .conflictRemain:
            return "이미 존재합니다"
        }
    }
}

public extension Error {
    var asDMSError: DmsError {
        self as? DmsError ?? .unknown
    }
}
