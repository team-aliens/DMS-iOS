import Combine
import Foundation

public protocol UploadFileUseCase {
    func execute(data: Data) -> AnyPublisher<String, Error>
}
