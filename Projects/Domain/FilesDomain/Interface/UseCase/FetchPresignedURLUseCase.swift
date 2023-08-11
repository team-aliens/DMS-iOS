import Combine
import Foundation

public protocol FetchPresignedURLUseCase {
    func execute() -> AnyPublisher<PresignedURLEntity, Error>
}
