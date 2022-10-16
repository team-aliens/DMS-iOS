import Foundation

public struct SigninRequestDTO: Encodable {
    public let accountID: String
    public let password: String

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case password
    }
}
