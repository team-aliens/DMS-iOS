import Combine
import FilesDomainInterface

public struct UploadFileUseCaseImpl: UploadFileUseCase {
    private let filesRepository: any FilesRepository

    public init(filesRepository: any FilesRepository) {
        self.filesRepository = filesRepository
    }

    public func execute(data: String) -> AnyPublisher<String, Error> {
        filesRepository.uploadFile(data: data)
    }
}
