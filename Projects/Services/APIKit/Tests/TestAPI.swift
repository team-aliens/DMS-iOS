import Moya
import Foundation
import APIKit

public enum TestAPI: TargetType, JwtAuthorizable {
    case success
    case failure
    case withAccess
    case withRefresh

    public var baseURL: URL { URL(string: "localhost")! }

    public var path: String { "/" }

    public var method: Moya.Method { .get }

    public var sampleData: Data {
        switch self {
        case .success:
            return """
{
    "access_token": "access",
    "refresh_token": "refresh",
    "expired_at": "expired"
}
""".data(using: .utf8)!

        case .failure:
            return """
{
    "test": "how",
    "access_token": "access"
}
""".data(using: .utf8)!

        default:
            return .init()
        }
    }

    public var task: Moya.Task { .requestPlain }

    public var headers: [String: String]? { nil }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .withAccess:
            return .accessToken

        case .withRefresh:
            return .refreshToken

        default:
            return .none
        }
    }
}
