import DataMappingModule
import Foundation
import ErrorModule
import Moya

public enum StudyRoomsAPI {
    case fetchStudyAvailableTime
    case fetchSeatTypes
    case fetchStudyRoomList(timeSlot: String?)
    case fetchDetailStudyRoom(roomID: String, timeSlot: String)
    case fetchMyStudyRoomApplicationItems
    case applyStudyRoomSeat(seatID: String, timeSlot: String)
    case cancelStudyRoomSeat(timeSlot: String)
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

        case let .fetchDetailStudyRoom(id, _):
            return "/\(id)/students"

        case let .applyStudyRoomSeat(id, _):
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
        switch self {
        case let .fetchStudyRoomList(timeSlot):
            return .requestParameters(
                parameters: [
                    "time_slot": timeSlot ?? ""
                ],
                encoding: URLEncoding.queryString
            )

        case let .fetchDetailStudyRoom(_, timeSlot):
            return .requestParameters(
                parameters: [
                    "time_slot": timeSlot
                ],
                encoding: URLEncoding.queryString
            )

        case let .applyStudyRoomSeat(_, timeSlot):
            return .requestParameters(
                parameters: [
                    "time_slot": timeSlot
                ],
                encoding: URLEncoding.queryString
            )

        case let .cancelStudyRoomSeat(timeSlot):
            return .requestParameters(
                parameters: [
                    "time_slot": timeSlot
                ],
                encoding: URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
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
