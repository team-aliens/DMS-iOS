import Combine
import Foundation

public protocol PresignedUploadFileUseCase {
    func execute(uploadURL: String, data: Data) -> AnyPublisher<Void, Error>
}
