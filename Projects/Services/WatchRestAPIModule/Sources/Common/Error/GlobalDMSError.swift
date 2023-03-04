import Foundation

public enum GlobalDMSError: Error {
    case unknown
    case internalServerError
}

extension GlobalDMSError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "알 수 없는 오류가 발생하였습니다. 다시 시도 후 지속되면 문의해주세요!"

        case .internalServerError:
            return "서버에서 문제가 발생했습니다. 잠시 후 다시 시도해주세요."
        }
    }
}
