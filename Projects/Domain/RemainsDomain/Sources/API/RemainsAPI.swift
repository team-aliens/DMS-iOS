import RemainsDomainInterface
import BaseDomain
import Moya

public enum RemainsAPI {
    case remainingApplicationsChanges(id: String)
    case fetchMyRemainApplicationItems
    case fetchRemainsAvailableTime
    case fetchRemainApplicationList
}

extension RemainsAPI: DmsAPI {
    public typealias ErrorType = RemainsDomainError

    public var domain: DmsDomain {
        .remains
    }

    public var urlPath: String {
        switch self {
        case let .remainingApplicationsChanges(id):
            return "/\(id)"

        case .fetchMyRemainApplicationItems:
            return "/my"

        case .fetchRemainsAvailableTime:
            return "/available-time"

        case .fetchRemainApplicationList:
            return "/options"
        }
    }

    public var method: Method {
        switch self {
        case .remainingApplicationsChanges:
            return .put

        case .fetchMyRemainApplicationItems, .fetchRemainsAvailableTime, .fetchRemainApplicationList:
            return .get
        }
    }

    public var task: Task {
        .requestPlain
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .remainingApplicationsChanges:
            return [
                400: .badRequest,
                401: .tokenExpired,
                403: .forbiddenRemainPeriod,
                404: .notFoundRemain,
                409: .conflictRemain,
                429: .tooManyRequest,
                500: .internalServerError
            ]

        case .fetchMyRemainApplicationItems:
            return [
                400: .badRequest,
                401: .tokenExpired,
                403: .forbiddenRemainPeriod,
                404: .notFoundRemain,
                429: .tooManyRequest,
                500: .internalServerError
            ]

        case .fetchRemainsAvailableTime:
            return [
                400: .badRequest,
                401: .tokenExpired,
                403: .forbiddenRemainPeriod,
                404: .notFoundRemain,
                429: .tooManyRequest,
                500: .internalServerError
            ]

        case .fetchRemainApplicationList:
            return [
                400: .badRequest,
                401: .tokenExpired,
                404: .notFoundRemain,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
