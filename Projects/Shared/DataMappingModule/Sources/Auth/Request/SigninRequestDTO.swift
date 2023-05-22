import Foundation

public struct SigninRequestDTO: Encodable {
    public let accountID: String
    public let password: String

    public init(accountID: String, password: String) {
        self.accountID = accountID
        self.password = password
    }

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case password
    }
}
