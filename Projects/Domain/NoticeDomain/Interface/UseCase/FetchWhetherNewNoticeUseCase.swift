import Combine

public protocol FetchWhetherNewNoticeUseCase {
    func execute() -> AnyPublisher<Bool, Error>
}
