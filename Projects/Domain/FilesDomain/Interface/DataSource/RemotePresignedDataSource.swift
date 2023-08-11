import Combine
import Foundation

public protocol RemotePresignedDataSource {
    func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, Error>
}
