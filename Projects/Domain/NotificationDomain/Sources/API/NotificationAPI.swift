import BaseDomain
import Moya
import NotificationDomainInterface

public enum NotificationAPI {
    case postDeviceToken(token: String)
}

extension NotificationAPI: DmsAPI {
    public typealias ErrorType = NotificationDomainError
    public var domain: DmsDomain {
        .notifications
    }

    public var urlPath: String {
        switch self {
        case .postDeviceToken:
            return "/token"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .postDeviceToken:
            return .post
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .postDeviceToken(token):
            return  .requestParameters(
                parameters: [
                    "token": token
                ], encoding: JSONEncoding.default
            )
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .postDeviceToken:
            return [
                400: .badRequest,
                401: .tokenExpired,
                403: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
