import Combine

public protocol ReissueTokenUseCase {
    func execute() -> AnyPublisher<SigninDmsFeatures, Error>
}
