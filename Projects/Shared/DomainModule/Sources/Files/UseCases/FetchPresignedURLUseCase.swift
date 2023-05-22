import Combine
import Foundation
import ErrorModule

public protocol FetchPresignedURLUseCase {
    func execute() -> AnyPublisher<PresignedURLEntity, DmsError>
}
