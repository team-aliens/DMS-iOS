import Foundation

public enum AuthCodeType: String, Codable {
    case signup = "SIGNUP"
    case accountId = "ACCOUNT_ID"
    case password = "PASSWORD"
}
