import Foundation

enum APIConstant {
    static let baseURL = URL(
        string: Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
    ) ?? URL(string: "https://www.google.com")!
}
