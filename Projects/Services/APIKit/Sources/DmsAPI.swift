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
        URL(string: "http://3.39.162.197:8080")!
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
    case students
    case losts
    case notices
    case meals
    case files
    case schools
    case points
    case users
}

extension DmsDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
