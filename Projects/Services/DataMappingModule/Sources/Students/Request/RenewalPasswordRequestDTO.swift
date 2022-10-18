import Foundation

public struct RenewalPasswordRequestDTO: Encodable {
    public let accountID: String
    public let name: String
    public let email: String
    public let authCode: String
    public let newPassword: String

    public init(accountID: String,
                name: String,
                email: String,
                authCode: String,
                newPassword: String) {
        self.accountID = accountID
        self.name = name
        self.email = email
        self.authCode = authCode
        self.newPassword = newPassword
    }

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case authCode = "auth_code"
        case newPassword = "new_password"
        case name, email
    }
}
