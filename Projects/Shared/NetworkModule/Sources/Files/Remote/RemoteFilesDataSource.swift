import Combine
import DataMappingModule
import ErrorModule
import Foundation

public protocol RemoteFilesDataSource {
    func uploadFile(data: Data) -> AnyPublisher<String, DmsError>
}
