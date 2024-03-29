import FilesDomainInterface
import Foundation
import BaseDomain
import Combine

public final class RemoteFilesDataSourceImpl: BaseRemoteDataSource<FilesAPI>, RemoteFilesDataSource {
    public func uploadFile(data: Data) -> AnyPublisher<String, Error> {
        request(.uploadFile(data: data), dto: UploadFileResponseDTO.self)
            .map(\.fileURL)
            .eraseToAnyPublisher()
    }

    public func fetchPresignedURL() -> AnyPublisher<PresignedURLEntity, Error> {
        request(.fetchPresignedURL, dto: FetchPresignedURLResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
