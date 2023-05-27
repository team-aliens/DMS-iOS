import Combine
import ErrorModule
import Foundation

public protocol FilesRepository {
    func uploadFile(data: Data) -> AnyPublisher<String, Error>
}
