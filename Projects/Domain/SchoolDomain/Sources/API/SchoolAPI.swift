import SchoolDomainInterface
import BaseDomain
import Moya

public enum SchoolAPI {
    case fetchSchoolList
    case fetchSchoolQuestion(authCode: String)
    case checkSchoolQuestion(schoolID: String, answer: String)
    case checkSchoolCode(code: String)
}

extension SchoolAPI: DmsAPI {
    public typealias ErrorType = SchoolDomainError

    public var domain: DmsDomain {
        .schools
    }

    public var urlPath: String {
        switch self {
        case .fetchSchoolList:
            return ""

        case let .fetchSchoolQuestion(authCode):
            return "/question/\(authCode)"

        case let .checkSchoolQuestion(schoolID, _):
            return "/answer/\(schoolID)"

        case .checkSchoolCode:
            return "/code"
        }
    }

    public var method: Method {
        return .get
    }

    public var task: Task {
        switch self {
        case let .checkSchoolQuestion(_, answer):
            return .requestParameters(parameters: [
                "answer": answer
            ], encoding: URLEncoding.queryString)

        case let .checkSchoolCode(code):
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

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchSchoolList:
            return [
                429: .tooManyRequest,
                500: .internalServerError
            ]
        case .fetchSchoolQuestion:
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

        case .checkSchoolCode:
            return [
                400: .badRequest,
                401: .authCodeMismatch,
                404: .notFoundSchool,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }

}
