import Combine
import DomainModule
import DataMappingModule
import ErrorModule
import Foundation

public protocol RemotePresignedDataSource {
    func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, DmsError>
}
