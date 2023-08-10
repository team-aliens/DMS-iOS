import Combine
import AuthDomainInterface
import Keychain

public struct LocalAuthDataSourceImpl: LocalAuthDataSource {
    private let keychain: any Keychain

    public init(keychain: any Keychain) {
        self.keychain = keychain
    }

    public func logout() {
        keychain.delete(type: .accessToken)
        keychain.delete(type: .accessExpiredAt)
        keychain.delete(type: .refreshToken)
        keychain.delete(type: .refreshExpiredAt)
    }
}
