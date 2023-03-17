import DataMappingModule
import ErrorModule
import Moya

public enum StudyRoomsAPI {
    case fetchStudyAvailableTime
    case fetchSeatTypes
    case fetchStudyRoomList
    case fetchDetailStudyRoom(roomID: String)
    case fetchMyStudyRoomApplicationItems
    case applyStudyRoomSeat(seatID: String)
    case cancelStudyRoomSeat
    case fetchStudyroomTimeList
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
            return "/types"

        case .fetchStudyRoomList:
            return "/list/students"

        case let .fetchDetailStudyRoom(id):
            return "/\(id)/students"

        case let .applyStudyRoomSeat(id):
            return "/seats/\(id)"

        case .cancelStudyRoomSeat:
            return "/seats"

        case .fetchMyStudyRoomApplicationItems:
            return "/my"
        case .fetchStudyroomTimeList:
            return "/time-slots"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchStudyAvailableTime, .fetchSeatTypes, .fetchStudyRoomList,
                .fetchDetailStudyRoom, .fetchMyStudyRoomApplicationItems,
                .fetchStudyroomTimeList:
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
                401: .unavailableSex,
                403: .noPermissionApplyTime,
                409: .seatIsAlreadyExist,
                429: .tooManyRequest,
                500: .internalServerError
            ]

        case .fetchDetailStudyRoom:
            return [
                400: .badRequest,
                500: .photoCapacityIsLarge
            ]

        case .cancelStudyRoomSeat:
            return [
                400: .badRequest,
                404: .notFoundAppliedSeat,
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
