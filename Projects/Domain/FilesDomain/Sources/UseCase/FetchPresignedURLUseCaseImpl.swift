import Combine
import Foundation
import FilesDomainInterface

public struct FetchPresignedURLUseCaseImpl: FetchPresignedURLUseCase {
    private let filesRepository: any FilesRepository

    public init(filesRepository: any FilesRepository) {
        self.filesRepository = filesRepository
    }

    public func execute() -> AnyPublisher<PresignedURLEntity, Error> {
        filesRepository.fetchPresignedURL()
    }
}
