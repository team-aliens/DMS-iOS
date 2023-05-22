public enum JwtStoreType: String {
    case accessToken = "ACCESS-TOKEN"
    case refreshToken = "REFRESH-TOKEN"
    case accessExpiredAt = "ACCESS-EXPIRED-AT"
    case refreshExpiredAt = "REFRESH-EXPIRED-AT"
}

public protocol JwtStore {
    func save(type: JwtStoreType, value: String)
    func load(type: JwtStoreType) -> String
    func delete(type: JwtStoreType)
}
