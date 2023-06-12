import AuthDomainInterface
import Combine
import Foundation

public struct SigninUseCaseFake: SigninUseCase {
    public init () {}

    public func execute(req: SigninRequestDTO) -> AnyPublisher<SigninDmsFeatures, Error> {
        if req.accountID == "baekteun" && req.password == "baekteun" {
            return Just(SigninDmsFeatures(
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
            return Fail(error: AuthDomainError.passwordMismatch)
                .delay(for: 1, scheduler: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    }
}
