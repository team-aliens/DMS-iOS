import StudyRoomsDomainInterface
import DesignSystem
import SwiftUI

struct StudyroomTimeListCellView: View {
    var isSelected: Bool = false
    var timeSlots: TimeSlotsEntity
    let buttonAction: () -> Void

    public init(
        isSelected: Bool,
        timeSlots: TimeSlotsEntity,
        buttonAction: @escaping () -> Void
    ) {
        self.isSelected = isSelected
        self.timeSlots = timeSlots
        self.buttonAction = buttonAction
    }

    var body: some View {
        HStack {
            Button {
                if !isSelected {
                    buttonAction()
                }
            } label: {
                Text("\(timeSlots.startTime) ~ \(timeSlots.endTime)")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .dmsFont(
                        .etc(.button),
                        color: isSelected ? .GrayScale.gray1 : .GrayScale.gray4
                    )
                    .background(
                        isSelected ? Color.PrimaryVariant.primary : Color.GrayScale.gray1
                    )
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .inset(by: 1)
                    .stroke(
                        isSelected ? Color.System.primary : Color.GrayScale.gray4,
                        lineWidth: 2
                    )
            )
            .cornerRadius(5)
            .padding(.horizontal, 5)
        }
    }
}
