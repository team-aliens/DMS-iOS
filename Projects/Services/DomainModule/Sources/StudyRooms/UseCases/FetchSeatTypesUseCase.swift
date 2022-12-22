import Combine
import DataMappingModule
import ErrorModule

public protocol FetchSeatTypesUseCase {
    func execute() -> AnyPublisher<[SeatTypeEntity], DmsError>
}
