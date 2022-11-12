import DataMappingModule
import ErrorModule
import Moya

public enum PointsAPI {
    case fetchPointsList(String)
}

extension PointsAPI: DmsAPI {
    public var domain: DmsDomain {
        .points
    }

    public var urlPath: String {
        switch self {
        case let .fetchPointsList(date):
            return "/\(date)"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Moya.Task {
        return .requestPlain
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorModule.DmsError] {
        [
            400: .badRequest,
            500: .internalServerError
        ]
    }
}
