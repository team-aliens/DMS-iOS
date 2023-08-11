import Combine
import DomainModule
import DataMappingModule
import ErrorModule
import Foundation

public protocol RemoteFilesDataSource {
    func uploadFile(data: Data) -> AnyPublisher<String, DmsError>
    func fetchPresignedURL() -> AnyPublisher<PresignedURLEntity, DmsError>
}
