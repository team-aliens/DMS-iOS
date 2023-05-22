import Combine
import ErrorModule
import Foundation

public protocol UploadFileUseCase {
    func execute(data: Data) -> AnyPublisher<String, DmsError>
}
