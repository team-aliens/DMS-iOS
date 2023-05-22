import DesignSystem
import DomainModule
import SwiftUI
import Utility

extension StudyRoomDetailView {

    @ViewBuilder
    func studyRoomSeatTypeView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.seatTypes, id: \.self) { seatType in
                    HStack {
                        Circle()
                            .foregroundColor(Color(hex: seatType.color))
                            .frame(width: 10, height: 10)
                        Spacer()
                            .frame(width: 4)

                        Text(seatType.name)
                            .dmsFont(.etc(.overline), color: .System.backgroundTitle)
                    }
                }
            }
        }
    }
}
