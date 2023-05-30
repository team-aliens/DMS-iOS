import FilesDomainInterface
import Foundation
import BaseDomain
import Moya

public enum FilesAPI {
    case uploadFile(data: Data)
}

extension FilesAPI: DmsAPI {
    public typealias ErrorType = FilesDomainError

    public var domain: DmsDomain {
        .files
    }

    public var urlPath: String {
        return ""
    }

    public var method: Moya.Method {
        return .post
    }

    public var task: Task {
        switch self {
        case let .uploadFile(data):
            return .uploadMultipart([
                .init(
                    provider: .data(data),
                    name: "file",
                    fileName: "\(UUID().uuidString).png"
                )
            ])
        }
    }

    public var jwtTokenType: JwtTokenType {
        .none
    }

    public var errorMap: [Int: ErrorType] {
        [
            400: .badRequest,
            500: .internalServerError
        ]
    }
}
