import Combine
import DataMappingModule
import ErrorModule

public protocol FetchMyProfileUseCase {
    func execute() -> AnyPublisher<MyProfileEntity, Error>
}
