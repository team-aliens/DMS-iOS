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
        URL(string: "https://google.com")! // TODO: 서버의 배포가 완료되기 전에는 구글에게 몰래 요청을 날립니다
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
    case images
    case schools
}

extension DmsDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
