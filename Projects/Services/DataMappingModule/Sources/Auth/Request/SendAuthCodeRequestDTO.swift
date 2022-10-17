import Foundation

public struct SendAuthCodeRequestDTO: Encodable {
    public let email: String
    public let type: AuthCodeType

    public init(email: String, type: AuthCodeType) {
        self.email = email
        self.type = type
    }
}
