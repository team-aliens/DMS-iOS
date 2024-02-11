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
        VStack {
            Spacer()
                .frame(height: 1)

            ScrollView(showsIndicators: false) {
                OutingApplyNoticeView(notice: viewModel.rangeString)

                if viewModel.isApplied {
                    RecentOutingApplyView(
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
                    VStack(alignment: .leading) {
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
                                            .padding(.trailing, 14)

                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.System.icon)
                                            .padding(.trailing, 5)
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 15)
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

                        DMSWideButton(text: "외출 신청하기", color: .PrimaryVariant.primary)
                            .padding(.top, 60)
                            .padding(.bottom, 70)
                    }
                    .padding(.horizontal, 24)
                }
            }
        }
        .navigationTitle("외출 신청")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
    }
}
