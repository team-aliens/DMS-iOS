import Foundation

public struct ChangePasswordParm: Equatable {
    public init(
        name: String,
        email: String,
        id: String,
        authCode: String
    ) {
        self.name = name
        self.email = email
        self.id = id
        self.authCode = authCode

    }

    public let name: String
    public let email: String
    public let id: String
    public let authCode: String
}
