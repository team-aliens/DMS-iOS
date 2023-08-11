import Combine
import DomainModule
import Foundation
import ErrorModule

public struct PresignedUploadFileUseCaseImpl: PresignedUploadFileUseCase {
    private let presignedRepository: any PresignedRepository

    public init(presignedRepository: any PresignedRepository) {
        self.presignedRepository = presignedRepository
    }

    public func execute(uploadURL: String, data: Data) -> AnyPublisher<Void, DmsError> {
        presignedRepository.presignedUploadFile(uploadURL: uploadURL, data: data)
    }
}
