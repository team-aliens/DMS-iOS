import Combine

public protocol FindIDUseCase {
    func execute(req: FindIDRequestDTO) -> AnyPublisher<String, Error>
}
