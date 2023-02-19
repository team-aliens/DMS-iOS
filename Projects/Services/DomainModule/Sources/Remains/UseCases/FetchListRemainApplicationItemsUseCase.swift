import Combine
import DataMappingModule
import ErrorModule

public protocol FetchListRemainApplicationItemsUseCase {
    func execute() -> AnyPublisher<ListRemainApplicationItemsEntity,
                                  DmsError>
}
