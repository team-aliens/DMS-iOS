import DomainModule
import DesignSystem
import SwiftUI

struct StudyroomTimeListCellView: View {
    @State var isClicked: Bool = false
    var list: TimeSlotsEntity
    let buttonAction: () -> Void
    public init(
        isClicked: Bool,
        list: TimeSlotsEntity,
        buttonAction: @escaping () -> Void
    ) {
        self.isClicked = isClicked
        self.list = list
        self.buttonAction = buttonAction
    }

    var body: some View {
        HStack {
            Button {
                if !isClicked {
                    buttonAction()
                }
            } label: {
                Text("\(list.startTime) ~ \(list.endTime)")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .dmsFont(
                        .etc(.button),
                        color: isClicked ? .GrayScale.gray1 : .GrayScale.gray4
                    )
                    .background {
                        isClicked ? Color.PrimaryVariant.primary : Color.GrayScale.gray1
                    }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .inset(by: 1)
                    .stroke(
                        isClicked ? Color.System.primary : Color.GrayScale.gray4,
                        lineWidth: 2
                    )
            )
            .cornerRadius(5)
            .padding(.horizontal, 5)
        }
    }
}
