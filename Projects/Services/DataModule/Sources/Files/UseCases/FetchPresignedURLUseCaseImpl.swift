import Combine
import Foundation
import DomainModule
import ErrorModule

public struct FetchPresignedURLUseCaseImpl: FetchPresignedURLUseCase {
    private let filesRepository: any FilesRepository

    public init(filesRepository: any FilesRepository) {
        self.filesRepository = filesRepository
    }

    public func execute() -> AnyPublisher<PresignedURLEntity, DmsError> {
        filesRepository.fetchPresignedURL()
    }
}
