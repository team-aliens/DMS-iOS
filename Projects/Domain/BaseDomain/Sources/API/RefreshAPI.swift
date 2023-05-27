import Moya

public enum RefreshAPI {
    case reissueToken
}

extension RefreshAPI: JobisAPI {
    public typealias ErrorType = RefreshError

    public var domain: JobisDomain {
        .users
    }

    public var urlPath: String {
        switch self {
        case .reissueToken:
            return "/reissue"
        }
    }

    public var method: Method {
        switch self {
        case .reissueToken:
            return .put
        }
    }

    public var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .reissueToken:
            return .refreshToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .reissueToken:
            return [
                401: .unauthorized,
                404: .unauthorized
            ]
        }
    }
}
