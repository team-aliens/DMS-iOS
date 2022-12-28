import BaseFeature
import DomainModule
import DataMappingModule
import Combine
import Foundation

final class StudyRoomDetailViewModel: BaseViewModel {
    @Published var studyRoomDetail: DetailStudyRoomEntity = .init(
        floor: 0,
        name: "",
        totalAvailableSeat: 0,
        inUseHeadcount: 0,
        availableSex: .all,
        availableGrade: 0,
        eastDescription: "",
        westDescription: "",
        southDescription: "",
        northDescription: "",
        totalWidthSize: 0,
        totalHeightSize: 0,
        seats: []
    )
    @Published var seatTypes: [SeatTypeEntity] = []
    @Published var seat: [[SeatEntity]] = [[]]
    @Published var availableTimeString: String = ""

    let studyRoomEntity: StudyRoomEntity

    private let fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase
    private let fetchSeatTypesUseCase: any FetchSeatTypesUseCase
    private let fetchDetailStudyRoomUseCase: any FetchDetailStudyRoomUseCase
    private let applyStudyRoomSeatUseCase: any ApplyStudyRoomSeatUseCase
    private let cancelStudyRoomSeatUseCase: any CancelStudyRoomSeatUseCase

    public init(
        studyRoomEntity: StudyRoomEntity,
        fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase,
        fetchSeatTypesUseCase: any FetchSeatTypesUseCase,
        fetchDetailStudyRoomUseCase: any FetchDetailStudyRoomUseCase,
        applyStudyRoomSeatUseCase: any ApplyStudyRoomSeatUseCase,
        cancelStudyRoomSeatUseCase: any CancelStudyRoomSeatUseCase
    ) {
        self.studyRoomEntity = studyRoomEntity
        self.fetchStudyAvailableTimeUseCase = fetchStudyAvailableTimeUseCase
        self.fetchSeatTypesUseCase = fetchSeatTypesUseCase
        self.fetchDetailStudyRoomUseCase = fetchDetailStudyRoomUseCase
        self.applyStudyRoomSeatUseCase = applyStudyRoomSeatUseCase
        self.cancelStudyRoomSeatUseCase = cancelStudyRoomSeatUseCase
    }

    func onAppear() {
        fetchStudyAvailableTime()
        fetchSeatType()
        fetchDetailStudyRoom()
    }

    func fetchSeatType() {
        addCancellable(
            fetchSeatTypesUseCase.execute()
        ) { [weak self] seatTypes in
            self?.seatTypes = seatTypes
        }
    }

    func fetchStudyAvailableTime() {
        addCancellable(
            fetchStudyAvailableTimeUseCase.execute()
        ) { [weak self] availableTime in
            var startTime = availableTime.startAt.toSmallDMSTimeString()
            var endTime = availableTime.endAt.toSmallDMSTimeString()
            print(startTime, endTime)
            self?.availableTimeString = "자습실 신청 시간은 \(startTime) ~ \(endTime) 까지 입니다."
        }
    }

    func fetchDetailStudyRoom() {
        addCancellable(
            fetchDetailStudyRoomUseCase.execute(
                roomID: self.studyRoomEntity.id
            )
        ) { [weak self] detailStudyRoom in
            self?.studyRoomDetail = detailStudyRoom
        }
    }

    func detailRoomSeatTwoDimensional() {
        let width = self.studyRoomDetail.totalWidthSize
        let height = self.studyRoomDetail.totalHeightSize
        let beforeSeat = self.studyRoomDetail.seats
        var totalCount = 0

        for widthCount in 0..<width {
            for heightCount in 0..<height {
                self.seat[widthCount+1][heightCount+1] = beforeSeat[totalCount]
                totalCount += 1
            }
        }
        totalCount = 0
    }
}
