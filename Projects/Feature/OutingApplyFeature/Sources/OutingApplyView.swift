import SwiftUI
import DesignSystem

struct OutingApplyView: View {
    @StateObject var viewModel: OutingApplyViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: OutingApplyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            OutingApplyNoticeView(notice: viewModel.rangeString)

            if viewModel.isApplied {
                Text("최근 내역")
                    .dmsFont(.body(.body2), color: .GrayScale.gray5)
                    .padding(.bottom, 10)

                OutingApplyContentView(
                    date: "2023.05.04",
                    type: "식사 외출",
                    isAccepted: true,
                    startTime: "00:00",
                    endTime: "00:00",
                    people: "홍길동, 홍길동, 홍길동, 홍길동",
                    place: "둔산동",
                    reason: "기말고사가 끝나서 마음가짐을 refresh하는 차원에서 맛있는걸 먹고 오고 싶습니다"
                )
            }
        }
        .navigationTitle("외출 신청")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
    }
}
