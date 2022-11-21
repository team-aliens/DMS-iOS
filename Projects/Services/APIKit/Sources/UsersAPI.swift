import Moya
import DataMappingModule
import ErrorModule
import Foundation

public enum UsersAPI {
    case changePassword(ChangePasswordRequestDTO)
}

extension UsersAPI: DmsAPI {
    public var domain: DmsDomain {
        .users
    }

    public var urlPath: String {
        switch self {
        case .changePassword:
            return "/password"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .changePassword:
            return .patch
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .changePassword(req):
            return .requestJSONEncodable(req)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        .none
    }

    public var errorMap: [Int: DmsError] {
        switch self {
        case .changePassword:
            return [
                400: .badRequest,
                401: .authCodeMismatch,
                404: .notFoundAuthInfo,
                500: .internalServerError
            ]
        }
    }
}
