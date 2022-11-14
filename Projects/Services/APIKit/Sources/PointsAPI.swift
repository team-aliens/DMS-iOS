import DataMappingModule
import ErrorModule
import Moya

public enum PointsAPI {
    case fetchPointsList(String)
}

public enum PointsType: String {
    case all = "ALL"
    case bonus = "BONUS"
    case minus = "MINUS"
}

extension PointsAPI: DmsAPI {
    public var domain: DmsDomain {
        .points
    }

    public var urlPath: String {
        switch self {
        case let .fetchPointsList(type):
            return "/\(type)"
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