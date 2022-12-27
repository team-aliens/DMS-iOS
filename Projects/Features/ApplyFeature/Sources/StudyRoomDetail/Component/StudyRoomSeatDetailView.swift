import DesignSystem
import DomainModule
import DataMappingModule
import SwiftUI
import Utility

extension StudyRoomDetailView {

    @ViewBuilder
    func studyRoomSeatDetailView() -> some View {
        ScrollView([.horizontal, .vertical]) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.studyRoomDetail.seats, id: \.self) { singleSeat in
                    DMSSeatButton(
                        text: generateSeatButtonText(seat: singleSeat),
                        style: singleSeat.status,
                        color: Color(hex: singleSeat.type?.color ?? "")
                    )
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
}
