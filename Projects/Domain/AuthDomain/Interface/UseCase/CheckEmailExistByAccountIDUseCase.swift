import Combine
import DataMappingModule
import ErrorModule

public protocol CheckEmailExistByAccountIDUseCase {
    func execute(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, Error>
}
