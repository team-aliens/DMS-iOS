import DesignSystem
import DomainModule
import DataMappingModule
import SwiftUI
import Utility

struct StudyRoomSeatDetailView: View {
    var detailStudyRoom: DetailStudyRoomEntity
    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 40), count: detailStudyRoom.totalWidthSize)
    }

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            LazyVGrid(columns: columns) {
                ForEach(detailStudyRoom.seats, id: \.self) { singleSeat in
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
