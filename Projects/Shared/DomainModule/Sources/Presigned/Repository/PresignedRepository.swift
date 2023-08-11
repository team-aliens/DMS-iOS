import Combine
import Foundation
import DataMappingModule
import ErrorModule

public protocol PresignedRepository {
    func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, DmsError>
}
