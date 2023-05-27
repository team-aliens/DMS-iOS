import Combine
import DataMappingModule
import ErrorModule

public protocol FetchMyRemainApplicationItemsUseCase {
    func execute() -> AnyPublisher<MyRemainApplicationItemsEntity, Error>
}
