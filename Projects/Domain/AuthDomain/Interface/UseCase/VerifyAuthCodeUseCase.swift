import Combine

public protocol VerifyAuthCodeUseCase {
    func execute(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
}
