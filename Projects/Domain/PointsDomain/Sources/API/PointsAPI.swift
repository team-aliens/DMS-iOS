import PointsDomainInterface
import BaseDomain
import Moya

public enum PointsAPI {
    case fetchPointsList(type: PointsType)
}

extension PointsAPI: DmsAPI {
    public var domain: DmsDomain {
        .points
    }

    public var urlPath: String {
        switch self {
        case .fetchPointsList:
            return ""
        }
    }

    public var method: Method {
        return .get
    }

    public var task: Task {
        switch self {
        case let .fetchPointsList(type):
            return .requestParameters(parameters: [
                    "type": type.rawValue
                ], encoding: URLEncoding.queryString)
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorType] {
        [
            400: .badRequest,
            500: .internalServerError
        ]
    }
}
