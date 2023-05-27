import Combine

public protocol RemoteUsersDataSource {
    func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error>
    func compareCurrentPasssword(password: String) -> AnyPublisher<Void, Error>
}
