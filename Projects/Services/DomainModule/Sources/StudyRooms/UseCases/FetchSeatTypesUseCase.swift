import Combine
import DataMappingModule
import ErrorModule

public protocol FetchSeatTypesUseCase {
    func execute(studyroomID: String) -> AnyPublisher<[SeatTypeEntity], DmsError>
}
