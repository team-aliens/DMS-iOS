import APIKit
import Combine
import DataMappingModule
import ErrorModule
import Foundation

public final class RemoteFilesDataSourceImpl: BaseRemoteDataSource<FilesAPI>, RemoteFilesDataSource {
    public func uploadFile(data: Data) -> AnyPublisher<String, DmsError> {
        request(.uploadFile(data: data), dto: UploadFileResponseDTO.self)
            .map(\.fileURL)
            .eraseToAnyPublisher()
    }
}
