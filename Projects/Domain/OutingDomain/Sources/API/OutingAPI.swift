import OutingDomainInterface
import BaseDomain
import Moya

public enum OutingAPI {
    case fetchMyOutingApplicationItem
}

extension OutingAPI: DmsAPI {
    public typealias ErrorType = OutingDomainError

    public var domain: DmsDomain {
        .outings
    }

    public var urlPath: String {
        switch self {
        case .fetchMyOutingApplicationItem:
            return "/my"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchMyOutingApplicationItem:
            return .get
        }
    }

    public var task: Moya.Task {
        .requestPlain
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchMyOutingApplicationItem:
            return [
                400: .badRequest,
                401: .tokenExpired,
                403: .forbidden,
                404: .notFound,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
