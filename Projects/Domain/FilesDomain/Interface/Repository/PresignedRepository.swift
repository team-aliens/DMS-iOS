import Combine
import Foundation

public protocol PresignedRepository {
    func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, Error>
}
