import Combine

public protocol FetchSeatTypesUseCase {
    func execute(studyroomID: String) -> AnyPublisher<[SeatTypeEntity], Error>
}
