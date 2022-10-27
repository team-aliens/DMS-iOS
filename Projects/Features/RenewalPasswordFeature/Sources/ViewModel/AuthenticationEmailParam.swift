import Foundation

public struct AuthenticationEmailParam: Equatable {
    public init(name: String, email: String, id: String) {
        self.name = name
        self.email = email
        self.id = id
    }
    
    public let name: String
    public let email: String
    public let id: String
}
