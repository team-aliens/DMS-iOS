import DesignSystem
import DomainModule
import SwiftUI

struct RemainApplyListCellView: View {
    @StateObject var viewModel: RemainApplyViewModel

    var body: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.remainApplicationList.remainOptions, id: \.self) { remainApplication in
                remainApplyListCellView(list: remainApplication)
            }
        }
        .onAppear {
            viewModel.fetchRemainApplicationList()
        }
    }

    @ViewBuilder
    func remainApplyListCellView(list: RemainOptionEntity) -> some View {
        var isSelected: Bool = {
            list == viewModel.selectedEntity
        }()
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Button(action: {
                    if !isSelected {
                        viewModel.selectedEntity = list
                    }
                }, label: {
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
                    }

                    Spacer()

                    Image(systemName: isSelected ? "chevron.up" : "chevron.down")
                        .foregroundColor(isSelected
                                         ? .System.primary : .GrayScale.gray7)
                        .padding(.trailing, 25)
                        .onTapGesture {
//                            viewModel.selectedNum = applyType.rawValue
//                            viewModel.selectedType = list.title
//                            viewModel.isDetailTapped.toggle()
                        }
                })
            }
//            if viewModel.isDetailTapped == true && viewModel.selectedNum == applyType.rawValue {
//                Text(list.description)
//                    .multilineTextAlignment(.leading)
//                    .dmsFont(.body(.body3), color: .GrayScale.gray9)
//                    .padding([.horizontal, .bottom], 20)
//            }
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
