import DesignSystem
import DomainModule
import DataMappingModule
import SwiftUI
import Utility

extension StudyRoomDetailView {

    @ViewBuilder
    func studyRoomSeatDetailView() -> some View {
        ScrollView([.horizontal, .vertical]) {
            LazyHGrid(rows: rows) {
                ForEach(viewModel.studyRoomDetail.seats, id: \.self) { singleSeat in
                    DMSSeatButton(
                        text: generateSeatButtonText(seat: singleSeat),
                        style: seatStatusToSeatStyle(status: singleSeat.status),
                        color: Color(hex: singleSeat.type?.color ?? ""),
                        isSelected: singleSeat == viewModel.selectedSeat
                    ) {
                        if viewModel.selectedSeat?.id == singleSeat.id || singleSeat.status != .available {
                            withAnimation {
                                viewModel.selectedSeat = nil
                            }
                        } else {
                            withAnimation {
                                viewModel.selectedSeat = singleSeat
                            }
                        }
                    }
                }
            }
        }
    }

    func generateSeatButtonText(seat: SeatEntity) -> String {
        var text: String {
            seat.status == .available ?
            String(seat.number ?? 0) :
            seat.student?.name ?? ""
        }
        return text
    }

    func seatStatusToSeatStyle(status: SeatStatusType) -> DMSSeatButtonStyle.Style {
        switch status {
        case .available:
            return .available

        case .unavailable:
            return .unavailable

        case .inUse:
            return .inUse

        case .empty:
            return .empty
        }
    }
}
