import Foundation

public struct SigninRequestDTO: Encodable {
    public init(accountID: String, password: String) {
        self.accountID = accountID
        self.password = password
    }

    public let accountID: String
    public let password: String

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case password
    }
}
