import SwiftUI
import DesignSystem

struct OutingApplyView: View {
    @StateObject var viewModel: OutingApplyViewModel
    @Environment(\.dismiss) var dismiss
    @State var dateText = ""
    @State var timeText = ""
    @State var typeText = "선택 1"
    @State var placeText = ""
    @State var reasonText = ""

    init(
        viewModel: OutingApplyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        OutingApplyNoticeView(notice: viewModel.rangeString)
            .padding(.horizontal, 24)

        ScrollView(showsIndicators: false) {
            if viewModel.isApplied {
                Text("최근 내역")
                    .dmsFont(.body(.body2), color: .GrayScale.gray5)
                    .padding(.top, 5)
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
            } else {
                OutingApplyTextField("외출 일자", "2023.06.28(수)", $dateText)
                    .padding(.top, 15)
                    .padding(.bottom, 40)

                OutingApplyTextField("외출 시간", "12:00 ~ 13:00", $timeText)
                    .padding(.bottom, 40)

                HStack(spacing: 20) {
                    Menu {
                        Button("식사 외출", action: { typeText = "식사 외출" })
                        Button("유형 1", action: { typeText = "유형 1" })
                        Button("유형 2", action: { typeText = "유형 2" })
                    } label: {
                        VStack(alignment: .leading) {
                            Text("외출 유형")
                                .dmsFont(.body(.body2), color: .GrayScale.gray10)
                                .padding(.bottom, 8)

                            HStack {
                                Text(typeText)
                                    .dmsFont(.body(.body2), color: .GrayScale.gray5)
                                    .padding(.trailing, 18)

                                Image(systemName: "chevron.down")
                                    .foregroundColor(.System.icon)
                                    .padding(.trailing, 16)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 17)
                            .overlay {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.GrayScale.gray5, lineWidth: 1)
                            }
                        }
                    }

                    OutingApplyTextField("외출 장소", "외출 장소를 입력해주세요.", $placeText)
                }
                .padding(.bottom, 40)

                VStack(alignment: .leading) {
                    Text("외출 사유")
                        .dmsFont(.body(.body2), color: .GrayScale.gray10)
                        .padding(.bottom, 8)

                    DMSFormTextEditor("내용을 입력해주세요.", text: $reasonText, minHeight: 150)
                }

//                OutingApplyTextField("외출 사유", "내용을 입력해주세요. \n\n\n\n", $reasonText)
//                    .padding(.bottom, 40)
            }
        }
        .padding(.horizontal, 24)
        .navigationTitle("외출 신청")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
    }
}
