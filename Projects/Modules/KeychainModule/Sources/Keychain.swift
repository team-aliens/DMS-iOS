public enum KeychainType: String {
    case accessToken = "ACCESS-TOKEN"
    case refreshToken = "REFRESH-TOKEN"
    case expiredAt = "EXPIRED-AT"
}

public protocol Keychain {
    func save(type: KeychainType, value: String)
    func load(type: KeychainType) -> String
    func delete(type: KeychainType)
}
