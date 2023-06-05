import Combine

public protocol UsersRepository {
    func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error>
    func compareCurrentPasssword(password: String) -> AnyPublisher<Void, Error>
}
