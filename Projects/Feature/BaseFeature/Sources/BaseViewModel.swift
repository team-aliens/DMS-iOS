import Combine
import UIKit

open class BaseViewModel: ObservableObject {
    @Published public var isErrorOcuured = false
    @Published public var isLoading = false
    @Published public var errorMessage = ""

    public var bag = Set<AnyCancellable>()

    public init() {}

    public func addCancellable<T>(
        _ publisher: AnyPublisher<T, Error>,
        onReceiveValue: @escaping (T) -> Void,
        onReceiveError: ((Error) -> Void)? = nil
    ) {
        isLoading = true
        publisher
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    if let onReceiveError {
                        onReceiveError(error)
                    }

                    self?.errorMessage = error.localizedDescription
                    self?.isErrorOcuured = true
                }
                self?.isLoading = false
            }, receiveValue: onReceiveValue)
            .store(in: &bag)
    }
}
