import DataMappingModule
import ErrorModule
import Moya

public enum NotificationAPI {
    
}

extension NotificationAPI: DmsAPI {
    public var domain: DmsDomain {
        <#Domain#>
    }

    public var urlPath: String {
        return ""
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
        [:]
    }
}
