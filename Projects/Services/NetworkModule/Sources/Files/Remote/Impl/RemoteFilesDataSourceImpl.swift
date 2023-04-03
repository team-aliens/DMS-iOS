import APIKit
import DomainModule
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

    public func fetchPresignedURL() -> AnyPublisher<PresignedURLEntity, DmsError> {
        request(.fetchPresignedURL, dto: FetchPresignedURLResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
