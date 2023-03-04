import Moya
import Foundation

public struct JwtPlugin: PluginType {
    private let jwtStore: any JwtStore

    public init(jwtStore: any JwtStore) {
        self.jwtStore = jwtStore
    }

    public func prepare(
        _ request: URLRequest,
        target: TargetType
    ) -> URLRequest {
        guard let jwtTokenType  = (target as? JwtAuthorizable)?.jwtTokenType,
              jwtTokenType != .none
        else { return request }
        var req = request
        let token = "\(getToken(type: jwtTokenType == .accessToken ? .accessToken : .refreshToken))"

        req.addValue(token, forHTTPHeaderField: jwtTokenType.rawValue)
        return req
    }

    public func didReceive(
        _ result: Result<Response, MoyaError>,
        target: TargetType
    ) {
        switch result {
        case let .success(res):
            if let new = try? res.map(TokenDTO.self) {
                saveToken(token: new)
            }
        default:
            break
        }
    }
}

private extension JwtPlugin {
    func getToken(type: JwtStoreType) -> String {
        switch type {
        case .accessToken:
            return "Bearer \(jwtStore.load(type: .accessToken))"

        case .refreshToken:
            return jwtStore.load(type: .refreshToken)

        case .accessExpiredAt:
            return jwtStore.load(type: .accessExpiredAt)

        case .refreshExpiredAt:
            return jwtStore.load(type: .refreshExpiredAt)
        }
    }

    func saveToken(token: TokenDTO) {
        jwtStore.save(type: .accessToken, value: token.accessToken)
        jwtStore.save(type: .refreshToken, value: token.refreshToken)
        jwtStore.save(type: .accessExpiredAt, value: token.accessExpiredAt)
        jwtStore.save(type: .refreshExpiredAt, value: token.refreshExpiredAt)
    }
}
