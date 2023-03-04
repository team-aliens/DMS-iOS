import Foundation

public protocol RemoteAPIRequestable {
    func data(from url: URL) async throws -> (Data, URLResponse)
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: RemoteAPIRequestable {}
