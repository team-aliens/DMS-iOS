import Combine
import Foundation
import ErrorModule

public protocol PresignedUploadFileUseCase {
    func execute(uploadURL: String, data: Data) -> AnyPublisher<Void, DmsError>
}
