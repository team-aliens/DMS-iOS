import SwiftUI
import RemainsDomainInterface
import DesignSystem

struct RemainApplyListCellView: View {
    @State private var isShowingDetail = false
    var list: RemainOptionEntity
    let isSelected: Bool
    let action: () -> Void
    public init(
        list: RemainOptionEntity,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.list = list
        self.isSelected = isSelected
        self.action = action
    }
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                if !isSelected {
                    action()
                }
            }, label: {
                VStack(alignment: .leading) {
                    HStack {
                        Text(list.title)
                            .dmsFont(.title(.title2), color: isSelected
                                     ? .System.primary : .GrayScale.gray7)
                            .frame(height: 32)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 20)

                        if list.isApplied {
                            Text("신청 완료")
                                .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                                .frame(height: 22)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 14)
                                .background(Color.PrimaryVariant.lighten2)
                                .cornerRadius(24)
                        }

                        Spacer()

                        Image(systemName: "chevron.down")
                            .foregroundColor(isSelected
                                             ? .System.primary : .GrayScale.gray7)
                            .rotationEffect(
                                isShowingDetail
                                ? Angle.degrees(180)
                                : .degrees(0)
                            )
                            .padding(25)
                            .onTapGesture {
                                withAnimation {
                                    isShowingDetail.toggle()
                                }
                            }
                    }
                    if isShowingDetail {
                        Text(list.description)
                            .multilineTextAlignment(.leading)
                            .dmsFont(.body(.body3), color: .GrayScale.gray9)
                            .padding([.horizontal, .bottom], 20)
                    }
                }
            })
        }
        .background(Color.System.surface)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 1)
                .stroke(isSelected ?
                        Color.System.primary : .clear,
                        lineWidth: 1.5)
        )
        .padding(.bottom, 12)
        .dmsShadow(style: .surface)
    }
}
