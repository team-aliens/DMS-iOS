import NotificationDomainInterface
import BaseDomain
import Moya

public enum NotificationAPI {
    case subscribeTopic(token: String, topic: TopicType)
}

extension NotificationAPI: DmsAPI {
    public typealias ErrorType = NotificationDomainError

    public var domain: DmsDomain {
        .notifications
    }

    public var urlPath: String {
        switch self {
        case .subscribeTopic:
            return "/topic"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .subscribeTopic:
            return .post
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .subscribeTopic(token, topic):
            return .requestParameters(
                parameters: [
                    "device_token": token,
                    "topic": topic
                ],
                encoding: JSONEncoding.default
            )
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .subscribeTopic:
            return [
                400: .badRequest,
                401: .tokenExpired,
                403: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
