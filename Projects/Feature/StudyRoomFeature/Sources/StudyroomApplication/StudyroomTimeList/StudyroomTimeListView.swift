import DesignSystem
import SwiftUI

struct StudyroomTimeListView: View {
    @StateObject var viewModel: StudyRoomListViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 37) {
            Text("시간")
                .dmsFont(.title(.subTitle1), color: .GrayScale.gray10)
                .frame(height: 28)
                .padding(.top, 40)
                .padding(.leading, 24)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.studyroomTimeList.timeSlots, id: \.self) { timeSlots in
                        StudyroomTimeListCellView(
                            isSelected: timeSlots.id == viewModel.selectedTimeEntity?.id,
                            timeSlots: timeSlots,
                            buttonAction: {
                                viewModel.selectedTimeEntity = timeSlots
                                viewModel.timeSlotParam = timeSlots.id
                            }
                        )
                    }
                }
                .padding(.horizontal, 19)
                .padding(.bottom, 10)
            }

            DMSWideButton(text: "확인", style: .contained, color: .PrimaryVariant.primary) {
                viewModel.isStudyTimeBottomSheet = false
                viewModel.selectStudyRoomTime()
            }
            .padding(.horizontal, 24)
            .padding(.bottom)
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
