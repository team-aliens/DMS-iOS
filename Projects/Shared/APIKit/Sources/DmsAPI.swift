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
        URL(
            string: Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        ) ?? URL(string: "https://www.google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
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
    case studyRooms = "study-rooms"
    case remains
}

extension DmsDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
