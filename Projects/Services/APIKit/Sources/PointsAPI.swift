import DataMappingModule
import ErrorModule
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
        case let .fetchPointsList(type):
            return "/\(type)"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Moya.Task {
        switch self {
        case .fetchPointsList(let type):
            return .requestParameters(parameters: [
                    "type": type.rawValue
                ],
                encoding: JSONEncoding.default)
        }
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
