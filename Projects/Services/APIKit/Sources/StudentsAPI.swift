import Moya
import DataMappingModule
import ErrorModule
import Foundation

public enum StudentsAPI {
    case signup(SignupRequestDTO)
    case checkDuplicateAccountID(id: String)
    case checkDuplicateEmail(email: String)
    case renewalPassword(RenewalPasswordRequestDTO)
    case findID(FindIDRequestDTO)
    case checkExistGradeClassNumber(CheckExistGradeClassNumberRequestDTO)
    case fetchMyProfile
    case changeProfileImage(url: String)
}

extension StudentsAPI: DmsAPI {
    public var domain: DmsDomain {
        .students
    }

    public var urlPath: String {
        switch self {
        case .signup:
            return "/signup"

        case .checkDuplicateAccountID:
            return "/account-id/duplication"

        case .checkDuplicateEmail:
            return "/email/duplication"

        case .renewalPassword:
            return "/password/initialization"

        case let .findID(req):
            return "/account-id/\(req.schoolID)"

        case .checkExistGradeClassNumber:
            return "/name"

        case .fetchMyProfile:
            return "/profile"

        case .changeProfileImage:
            return "/profile"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .checkDuplicateAccountID, .checkDuplicateEmail, .findID, .fetchMyProfile, .checkExistGradeClassNumber:
            return .get

        case .signup:
            return .post

        case .renewalPassword, .changeProfileImage:
            return .patch
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .signup(req):
            return .requestJSONEncodable(req)

        case let .checkDuplicateAccountID(id):
            return .requestParameters(parameters: [
                "account_id": id
            ], encoding: URLEncoding.queryString)

        case let .checkDuplicateEmail(email):
            return .requestParameters(parameters: [
                "email": email
            ], encoding: URLEncoding.queryString)

        case let .renewalPassword(req):
            return .requestJSONEncodable(req)

        case let .findID(req):
            return .requestParameters(parameters: [
                "name": req.name,
                "grade": req.grade,
                "class_room": req.classRoom,
                "number": req.number
            ], encoding: URLEncoding.queryString)

        case let .checkExistGradeClassNumber(req):
            return .requestParameters(parameters: [
                "school_id": req.schoolID,
                "grade": req.grade,
                "class_room": req.class,
                "number": req.number
            ], encoding: URLEncoding.queryString)

        case let .changeProfileImage(url):
            return .requestParameters(
                parameters: [
                    "profile_image_url": url
                ], encoding: JSONEncoding.default)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchMyProfile, .changeProfileImage:
            return .accessToken

        default:
            return .none
        }
    }

    public var errorMap: [Int: DmsError] {
        switch self {
        case .signup:
            return [
                400: .badRequest,
                409: .alreadyExistUserBySignup,
                500: .internalServerError
            ]

        case .checkDuplicateAccountID:
            return [
                400: .badRequest,
                409: .alreadyExistIDByCheckID,
                500: .internalServerError
            ]

        case .checkDuplicateEmail:
            return [
                400: .badRequest,
                409: .alreadyExistEmailByCheckEmail,
                500: .internalServerError
            ]

        case .renewalPassword:
            return [
                400: .badRequest,
                401: .authCodeMismatch,
                404: .notFoundAuthInfo,
                500: .internalServerError
            ]

        case .findID:
            return [
                400: .badRequest,
                401: .invalidStudentInfoByFindID,
                404: .notFoundUserBySignin,
                500: .internalServerError
            ]

        case .checkExistGradeClassNumber:
            return [
                400: .badRequest,
                404: .notFoundGradeClassNumber,
                409: .alreadyExistUserBySignup,
                500: .internalServerError
            ]

        case .fetchMyProfile:
            return [
                401: .tokenExpired,
                500: .internalServerError
            ]

        case .changeProfileImage:
            return [
                401: .tokenExpired,
                500: .internalServerError
            ]
        }
    }

    public var sampleData: Data {
        switch self {
        case .findID:
            return """
{
    "email" : "abc*****@gmail.com"
}
""".data(using: .utf8) ?? .init()

        case .fetchMyProfile:
            return """
{
    "school_name" : "?????????????????????????????????????????????",
    "name" : "?????????",
    "gcn" : "2118",
    "bonus_point" : 0,
    "minus_point" : 24,
    "phrase" : "??????????????? ??????????????? ??????????????????"
}
""".data(using: .utf8) ?? .init()

        default:
            return .init()
        }
    }
}
