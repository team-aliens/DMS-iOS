import Combine
import Foundation

public protocol ApplyStudyRoomSeatUseCase {
    func execute(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error>
}
