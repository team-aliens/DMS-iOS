import Foundation

public struct CheckAccountIDIsExistResponseDTO: Decodable {
    public init(email: String) {
        self.email = email
    }

    public let email: String
}
