import Combine

public protocol SignupUseCase {
    func execute(req: SignupRequestDTO) -> AnyPublisher<SignupDmsFeatures, Error>
}
