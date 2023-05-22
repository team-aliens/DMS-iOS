import Combine
import ErrorModule
import Foundation
import Moya

extension AnyPublisher where Output == Moya.Response, Failure == DmsError {
    func map<D: Decodable>(
        _ type: D.Type,
        atKeyPath keyPath: String? = nil,
        using decoder: JSONDecoder = JSONDecoder(),
        failsOnEmptyData: Bool = true
    ) -> AnyPublisher<D, DmsError> {
        return unwrapThrowable { response in
            try response.map(type, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)
        }
    }
}

extension AnyPublisher where Failure == DmsError {
    func unwrapThrowable<T>(throwable: @escaping (Output) throws -> T) -> AnyPublisher<T, DmsError> {
        self.tryMap { element in
            try throwable(element)
        }
        .mapError { $0.asDMSError }
        .eraseToAnyPublisher()
    }
}
