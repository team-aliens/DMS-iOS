import Moya

public enum MealAPI {
    case fetchMealList(String)
}

extension MealAPI: DMSAPI {
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

    public var errorMap: [Int: any Error] {
        [
            500: GlobalDMSError.internalServerError
        ]
    }
}
