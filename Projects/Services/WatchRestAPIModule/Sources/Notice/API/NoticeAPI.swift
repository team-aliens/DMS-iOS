import Moya

public enum NoticeAPI {
    case fetchNoticeList(order: NoticeOrderType)
    case fetchDetailNotice(id: String)
}

extension NoticeAPI: DMSAPI {
    public var domain: DmsDomain {
        .notices
    }

    public var urlPath: String {
        switch self {
        case .fetchNoticeList:
            return ""

        case let .fetchDetailNotice(id):
            return "/\(id)"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Moya.Task {
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

    public var errorMap: [Int: Error] {
        switch self {
        default:
            return [
                500: GlobalDMSError.internalServerError
            ]
        }
    }
}
