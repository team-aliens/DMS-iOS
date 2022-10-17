import Moya
import DataMappingModule
import ErrorModule

public enum AuthAPI {
    case signin(SigninRequestDTO)
    case verifyAuthCode(VerifyAuthCodeRequestDTO)
    case sendAuthCode(SendAuthCodeRequestDTO)
    case reissueToken
    case emailExistByAccountID(EmailExistByAccountIDRequestDTO)
    case checkAccountIDIsExist(id: String)
}

extension AuthAPI: DmsAPI {
    public var domain: DmsDomain {
        .auth
    }

    public var urlPath: String {
        switch self {
        case .signin:
            return "/tokens"

        case .verifyAuthCode, .sendAuthCode:
            return "/code"

        case .reissueToken:
            return "/reissue"

        case .emailExistByAccountID:
            return "/email"

        case .checkAccountIDIsExist:
            return "/account-id"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .verifyAuthCode, .emailExistByAccountID, .checkAccountIDIsExist:
            return .get

        case .signin, .sendAuthCode:
            return .post

        case .reissueToken:
            return .put
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .signin(req):
            return .requestJSONEncodable(req)

        case let .verifyAuthCode(req):
            return .requestParameters(parameters: [
                "email": req.email,
                "auth_code": req.authCode,
                "type": req.type.rawValue
            ], encoding: URLEncoding.queryString)

        case let .sendAuthCode(req):
            return .requestJSONEncodable(req)

        case let .emailExistByAccountID(req):
            return .requestParameters(parameters: [
                "account_id": req.accountID,
                "email": req.email
            ], encoding: URLEncoding.queryString)

        case let .checkAccountIDIsExist(id):
            return .requestParameters(parameters: [
                "account_id": id
            ], encoding: URLEncoding.queryString)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .reissueToken:
            return .refreshToken

        default:
            return .none
        }
    }

    public var errorMap: [Int: DmsError] {
        switch self {
        case .signin:
            return [
                400: .badRequest,
                401: .passwordMismatch,
                404: .notFoundUserBySignin
            ]

        case .verifyAuthCode:
            return [
                400: .badRequest,
                401: .authCodeMismatch,
                404: .notFoundAuthInfo
            ]

        case .sendAuthCode:
            return [
                400: .badRequest,
                429: .tooManyRequest
            ]

        case .reissueToken:
            return [
                401: .unknown
            ]

        case .emailExistByAccountID:
            return [
                400: .badRequest,
                401: .diffrentEmailByAccountID,
                404: .notFoundAccountID
            ]

        case .checkAccountIDIsExist:
            return [
                400: .badRequest,
                404: .notFoundAccountID
            ]
        }
    }
}
