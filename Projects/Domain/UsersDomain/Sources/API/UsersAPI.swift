import UsersDomainInterface
import BaseDomain
import Moya

public enum UsersAPI {
    case changePassword(ChangePasswordRequestDTO)
    case compareCurrentPasssword(password: String)
}

extension UsersAPI: DmsAPI {
    public typealias ErrorType = UsersDomainError
    public var domain: DmsDomain {
        .users
    }

    public var urlPath: String {
        switch self {
        case .changePassword, .compareCurrentPasssword:
            return "/password"
        }
    }

    public var method: Method {
        switch self {
        case .compareCurrentPasssword:
            return .get

        case .changePassword:
            return .patch
        }
    }

    public var task: Task {
        switch self {
        case let .changePassword(req):
            return .requestJSONEncodable(req)

        case let .compareCurrentPasssword(password):
            return .requestParameters(parameters: [
                "password": password
            ], encoding: URLEncoding.queryString)
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .changePassword:
            return [
                400: .badRequest,
                401: .authCodeMismatch,
                404: .notFoundAuthInfo,
                500: .internalServerError
            ]

        case .compareCurrentPasssword:
            return [
                400: .badRequest,
                401: .currentPasswordMismatch,
                500: .internalServerError
            ]
        }
    }
}
