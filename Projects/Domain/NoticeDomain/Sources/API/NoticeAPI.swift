import NoticeDomainInterface
import BaseDomain
import Moya

public enum NoticeAPI {
    case fetchWhetherNewNotice
    case fetchNoticeList(order: NoticeOrderType)
    case fetchDetailNotice(id: String)
}

extension NoticeAPI: DmsAPI {
    public typealias ErrorType = NoticeDomainError

    public var domain: DmsDomain {
        .notices
    }

    public var urlPath: String {
        switch self {
        case .fetchWhetherNewNotice:
            return "/status"

        case .fetchNoticeList:
            return ""

        case let .fetchDetailNotice(id):
            return "/\(id)"
        }
    }

    public var method: Method {
        return .get
    }

    public var task: Task {
        switch self {
        case let .fetchNoticeList(order):
            return .requestParameters(parameters: [
                "order": order.rawValue
            ], encoding: URLEncoding.queryString)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        default:
            return [
                400: .badRequest,
                401: .tokenExpired,
                404: .notFoundSchool,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
