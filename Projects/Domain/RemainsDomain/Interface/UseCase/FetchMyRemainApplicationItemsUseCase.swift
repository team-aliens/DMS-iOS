import Combine

public protocol FetchMyRemainApplicationItemsUseCase {
    func execute() -> AnyPublisher<MyRemainApplicationItemsEntity, Error>
}
