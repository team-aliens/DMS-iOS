import Foundation

public struct CheckAccountIDIsExistResponseDTO: Decodable {
    public let email: String

    public init(email: String) {
        self.email = email
    }
}
