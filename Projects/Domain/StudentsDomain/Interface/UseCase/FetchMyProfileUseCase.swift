import Combine

public protocol FetchMyProfileUseCase {
    func execute() -> AnyPublisher<MyProfileEntity, Error>
}
