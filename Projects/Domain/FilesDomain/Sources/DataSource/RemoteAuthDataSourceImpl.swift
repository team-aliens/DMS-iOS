import FilesDomainInterface
import BaseDomain
import Combine

public final class RemoteFilesDataSourceImpl: BaseRemoteDataSource<FilesAPI>, RemoteFilesDataSource {
    public func uploadFile(data: String) -> AnyPublisher<String, Error> {
        request(.uploadFile(data: String), dto: UploadFileResponseDTO.self)
            .map(\.fileURL)
            .eraseToAnyPublisher()
    }
}
