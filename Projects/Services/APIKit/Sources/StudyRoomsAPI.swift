import DataMappingModule
import ErrorModule
import Moya

public enum StudyRoomsAPI {
    case fetchStudyAvailableTime
    case fetchSeatTypes
    case fetchStudyRoomList
    case fetchDetailStudyRoom(roomID: String)
    case applyStudyRoomSeat(seatID: String)
    case cancelStudyRoomSeat
}

extension StudyRoomsAPI: DmsAPI {
    public var domain: DmsDomain {
        .studyRooms
    }

    public var urlPath: String {
        switch self {
        case .fetchStudyAvailableTime:
            return "/available-time"

        case .fetchSeatTypes:
            return "types"

        case .fetchStudyRoomList:
            return "/list/students"

        case let .fetchDetailStudyRoom(id):
            return "/\(id)/students"

        case let .applyStudyRoomSeat(id):
            return "/seats/\(id)"

        case .cancelStudyRoomSeat:
            return "/seats"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchStudyAvailableTime, .fetchSeatTypes, .fetchStudyRoomList, .fetchDetailStudyRoom:
            return .get

        case .applyStudyRoomSeat:
            return .put

        case .cancelStudyRoomSeat:
            return .delete
        }
    }

    public var task: Moya.Task {
        .requestPlain
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: ErrorModule.DmsError] {
        switch self {
        case .applyStudyRoomSeat:
            return [
                400: .badRequest,
                409: .seatIsAlreadyExist,
                500: .internalServerError
            ]

        default:
            return [
                400: .badRequest,
                500: .internalServerError
            ]
        }
    }
}
