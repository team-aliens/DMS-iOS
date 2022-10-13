import Foundation
import Moya
import ErrorModule

public protocol DmsAPI: TargetType, JwtAuthorizable {
    var domain: DmsDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: DmsError] { get }
}

public extension DmsAPI {
    var baseURL: URL {
        URL(string: "https://google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
}

public enum DmsDomain: String {
    case auth
    case users
    case losts
    case notices
    case meal
    case images
}

extension DmsDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
