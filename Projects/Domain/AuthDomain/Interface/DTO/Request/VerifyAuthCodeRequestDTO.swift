import Foundation

public struct VerifyAuthCodeRequestDTO {
    public let email: String
    public let authCode: String
    public let type: AuthCodeType

    public init(email: String, authCode: String, type: AuthCodeType) {
        self.email = email
        self.authCode = authCode
        self.type = type
    }
}
