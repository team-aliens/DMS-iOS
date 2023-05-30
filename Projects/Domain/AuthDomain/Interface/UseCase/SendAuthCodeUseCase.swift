import Combine

public protocol SendAuthCodeUseCase {
    func execute(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
}
