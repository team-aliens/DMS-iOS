import Moya
import DataMappingModule
import ErrorModule
import Foundation

public enum SchoolAPI {
    case getSchoolList
    case getSchoolQuestion(authCode: String)
    case checkSchoolQuestion(schoolID: String, answer: String)
    case checkSchoolAuthCode(schoolID: String, code: String)
}

extension SchoolAPI: DmsAPI {
    public var domain: DmsDomain {
        .schools
     }
    public var urlPath: String {
        switch self {
        case .getSchoolList:
            return "/"
        case let .getSchoolQuestion(authCode):
            return "/question/\(authCode)"
        case let .checkSchoolQuestion(schoolID, _):
            return "/answer/\(schoolID)"
        case let .checkSchoolAuthCode(schoolID, _):
            return "/code/\(schoolID)"
        }
    }

    public var errorMap: [Int: ErrorModule.DmsError] {
        switch self {
        case .getSchoolList:
            return [
                429: .tooManyRequest,
                500: .internalServerError
            ]
        case .getSchoolQuestion:
            return [
                400: .badRequest,
                404: .notFoundSchool,
                429: .tooManyRequest,
                500: .internalServerError
            ]

        case .checkSchoolQuestion:
            return [
                400: .badRequest,
                401: .invalidQuestionAnswer,
                404: .notFoundSchool,
                429: .tooManyRequest,
                500: .internalServerError
            ]

        case .checkSchoolAuthCode:
            return [
                400: .badRequest,
                401: .invalidQuestionAnswer,
                404: .notFoundSchool,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Moya.Task {
        switch self {
        case let .checkSchoolQuestion(_, answer):
            return .requestParameters(parameters: [
                "answer": answer
            ], encoding: URLEncoding.queryString)
        case let .checkSchoolAuthCode(_, code):
            return .requestParameters(parameters: [
                "school_code": code
            ], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        return .none
    }

}
