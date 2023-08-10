import Foundation
import ErrorModule
import Moya

var presignedBaseURL = ""

public enum PresignedAPI {
    case presignedUploadFile(uploadURL: String, data: Data)
}

extension PresignedAPI: DmsAPI {
    func setBaseURL() {
        switch self {
        case let .presignedUploadFile(uploadURL, _):
            presignedBaseURL = uploadURL
        }
    }

    public var baseURL: URL {
        switch self {
        case let .presignedUploadFile(uploadURL, _):
            return URL(string: presignedBaseURL) ?? URL(string: "\(uploadURL)")!
        }
    }

    public var urlPath: String {
        switch self {
        case .presignedUploadFile:
            return ""
        }
    }

    public var domain: DmsDomain {
        .presigned
    }
    public var method: Moya.Method {
        return .put
    }

    public var task: Moya.Task {
        switch self {
        case let .presignedUploadFile(_, data):
            return .uploadMultipart([
                .init(
                    provider: .data(data),
                    name: "file",
                    fileName: "\(UUID().uuidString).jpeg"
                )
            ])
        }
    }

    public var jwtTokenType: JwtTokenType {
        .none
    }

    public var errorMap: [Int: ErrorModule.DmsError] {
        [
            400: .badRequest,
            500: .internalServerError
        ]
    }

    public var headers: [String: String]? {
        [ "Content-Type": "image/jpeg" ]
    }
}
