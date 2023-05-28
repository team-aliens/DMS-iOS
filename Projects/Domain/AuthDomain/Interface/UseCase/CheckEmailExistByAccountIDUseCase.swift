import Combine

public protocol CheckEmailExistByAccountIDUseCase {
    func execute(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, Error>
}
