import DataMappingModule
import DomainModule
import ErrorModule
import Moya

public enum MealsAPI {
    case fetchMealList(String)
}

public extension MealsAPI: DmsAPI {
    public var domain: DmsDomain {
        .meals
    }

    public var urlPath: String {
        switch self {
        case let .fetchMealList(date):
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

    public var errorMap: [Int : ErrorModule.DmsError] {
        [
            400: .badRequest,
            500: .internalServerError
        ]
    }
}
