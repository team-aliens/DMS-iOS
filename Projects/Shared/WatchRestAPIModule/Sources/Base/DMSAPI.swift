import Foundation
import Moya

public protocol DMSAPI: TargetType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var domain: DmsDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: ErrorType] { get }
}

public extension DMSAPI {
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
    case notices
    case meals
}

extension DmsDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
