import Foundation

public struct EmailExistByAccountIDRequestDTO {
    public let accountID: String
    public let email: String

    public init(accountID: String, email: String) {
        self.accountID = accountID
        self.email = email
    }
}
