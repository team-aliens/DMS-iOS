import Foundation
import ErrorModule
import Moya

public enum FilesAPI {
    case uploadFile(data: Data)
    case fetchPresignedURL
}

extension FilesAPI: DmsAPI {
    public var domain: DmsDomain {
        .files
    }

    public var urlPath: String {
        switch self {
        case .fetchPresignedURL:
            return "/url"

        default:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchPresignedURL:
            return .get

        case .uploadFile:
            return .post
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .uploadFile(data):
            return .uploadMultipart([
                .init(
                    provider: .data(data),
                    name: "file",
                    fileName: "\(UUID().uuidString).jpeg"
                )
            ])

        case .fetchPresignedURL:
            return .requestParameters(
                parameters: [
                    "file_name": "file.jpeg"
                ],
                encoding: URLEncoding.queryString
            )
        }
    }

    public var jwtTokenType: JwtTokenType {
        .none
    }

    public var errorMap: [Int: DmsError] {
        [
            400: .badRequest,
            500: .internalServerError
        ]
    }
}
