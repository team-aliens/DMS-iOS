import BaseFeature
import DomainModule
import DataMappingModule
import Combine
import Foundation

final class StudyRoomDetailViewModel: BaseViewModel {
    @Published var studyRoomDetail: DetailStudyRoomEntity?
    @Published var seatTypes: [SeatTypeEntity] = []
    @Published var seat: [[SeatEntity]] = [[]]
    @Published var availableTimeString: String = ""
    @Published var isShowingToast = false
    @Published var toastMessage = ""
    @Published var selectedSeat: SeatEntity?

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
            let startTime = availableTime.startAt.toSmallDMSTimeString()
            let endTime = availableTime.endAt.toSmallDMSTimeString()
            self?.availableTimeString = "????????? ?????? ????????? \(startTime) ~ \(endTime) ?????? ?????????."
        }
    }

    func fetchDetailStudyRoom() {
        var newSeatArray: [SeatEntity] = []
        addCancellable(
            fetchDetailStudyRoomUseCase.execute(
                roomID: self.studyRoomEntity.id
            )
        ) { [weak self] detailStudyRoom in
            newSeatArray = self?.addEmptySeat(
                width: detailStudyRoom.totalWidthSize,
                height: detailStudyRoom.totalHeightSize,
                beforeArray: detailStudyRoom.seats
            ) ?? []

            self?.studyRoomDetail = .init(
                floor: detailStudyRoom.floor,
                name: detailStudyRoom.name,
                totalAvailableSeat: detailStudyRoom.totalAvailableSeat,
                inUseHeadcount: detailStudyRoom.inUseHeadcount,
                availableSex: detailStudyRoom.availableSex,
                availableGrade: detailStudyRoom.availableGrade,
                eastDescription: detailStudyRoom.eastDescription,
                westDescription: detailStudyRoom.westDescription,
                southDescription: detailStudyRoom.southDescription,
                northDescription: detailStudyRoom.northDescription,
                totalWidthSize: detailStudyRoom.totalWidthSize,
                totalHeightSize: detailStudyRoom.totalHeightSize,
                seats: newSeatArray
            )
        }
    }

    func applyStudyRoomSeat() {
        guard let selectedSeat else { return }
        addCancellable(
            applyStudyRoomSeatUseCase.execute(seatID: selectedSeat.id)
        ) { [weak self] _ in
            self?.fetchDetailStudyRoom()
            self?.isShowingToast = true
            self?.toastMessage = "????????? ????????? ?????????????????????."
        }
    }

    func cancelStudyRoomSeat() {
        addCancellable(
            cancelStudyRoomSeatUseCase.execute()
        ) { [weak self] _ in
            self?.fetchDetailStudyRoom()
            self?.isShowingToast = true
            self?.toastMessage = "????????? ????????? ?????????????????????."
        }
    }

    func addEmptySeat(width: Int, height: Int, beforeArray: [SeatEntity]) -> [SeatEntity] {
        if beforeArray.count == width * height {
            return beforeArray
        }

        var newArray = [SeatEntity?](
            repeating: nil,
            count: width * height
        )

        beforeArray.forEach { value in
            let index = (value.widthLocation - 1) * height + value.heightLocation - 1
            newArray[index] = value
        }
        return newArray.compactMap {
            $0 ?? SeatEntity(
                id: UUID().uuidString,
                widthLocation: 1,
                heightLocation: 1,
                status: .empty
            )
        }
    }
}
