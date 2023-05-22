import Foundation

public struct JwtStoreImpl: JwtStore {
    public init() {}

    private let bundleIdentifier: String = Bundle.main.bundleIdentifier ?? ""

    public func save(type: JwtStoreType, value: String) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: type.rawValue,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false) ?? .init()
        ]
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    public func load(type: JwtStoreType) -> String {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: type.rawValue,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        if status == errSecSuccess {
            guard let data = dataTypeRef as? Data else { return "" }
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    }

    public func delete(type: JwtStoreType) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: type.rawValue
        ]
        SecItemDelete(query)
    }
}
