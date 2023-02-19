import Moya
import DataMappingModule
import ErrorModule
import Foundation

public enum RemainsAPI {
    case remainingApplicationsChanges(id: String)
    case fetchMyRemainApplicationItems
    case fetchRemainsAvailableTime
    case fetchListRemainApplicationItems
}

extension RemainsAPI: DmsAPI {
    public var domain: DmsDomain {
        .remains
    }

    public var urlPath: String {
        switch self {
        case .remainingApplicationsChanges(let id):
            return "/\(id)"
        case .fetchMyRemainApplicationItems:
            return "/my"
        case .fetchRemainsAvailableTime:
            return "/available-time"
        case .fetchListRemainApplicationItems:
            return "/options"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .remainingApplicationsChanges:
            return .put
        case .fetchMyRemainApplicationItems, .fetchRemainsAvailableTime, .fetchListRemainApplicationItems:
            return .get
        }
    }

    public var task: Moya.Task {
        .requestPlain
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: DmsError] {
        switch self {
        default:
            return [
                400: .badRequest,
                500: .internalServerError
            ]
        }
    }
}
