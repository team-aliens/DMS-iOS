import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public struct SignupUseCaseFake: SignupUseCase {
    public init () {}

    public func execute(req: SignupRequestDTO) -> AnyPublisher<DmsFeatures, Error> {
        if req.accountID == "baekteun" && req.password == "baekteun" {
            return Just(DmsFeatures(
                mealService: true,
                noticeService: true,
                pointService: true,
                studyRoomService: false,
                remainService: false
            ))
            .setFailureType(to: Error.self)
            .delay(for: 1, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
        } else {
            return Fail(error: Error.self)
                .delay(for: 1, scheduler: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    }
}
