import Foundation

public struct FindIDResponseDTO: Decodable {
    public let email: String

    public init(email: String) {
        self.email = email
    }
}
