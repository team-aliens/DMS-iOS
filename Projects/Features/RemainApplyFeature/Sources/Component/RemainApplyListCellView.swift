import DesignSystem
import SwiftUI

struct RemainApplyListCellView: View {
    @EnvironmentObject var uiState: RemainStateModel

    let dummy1 = ApplyDummy(
        listNum: 0,
        listName: "금요 귀가",
        listContent: """
            금요일 일과가 모두 끝나고
            8시 30분 이후부터9시 30분까지 귀가하고
            일요일 6시 30분 부터 9시 30분까지 귀사해야 합니다.

            혹시나 개인 일정으로 부득이하기 금요일이 아닌, 토요일
            또는 일요일에 귀가해야 하는 학생들은 사감 선생님께
            말씀부탁드립니다.
            """)
    let dummy2 = ApplyDummy(
        listNum: 1,
        listName: "토요 귀가",
        listContent: """
            금요일 일과가 모두 끝나고
            8시 30분 이후부터9시 30분까지 귀가하고
            일요일 6시 30분 부터 9시 30분까지 귀사해야 합니다.

            혹시나 개인 일정으로 부득이하기 금요일이 아닌, 토요일
            또는 일요일에 귀가해야 하는 학생들은 사감 선생님께
            말씀부탁드립니다.
            """)
    let dummy3 = ApplyDummy(
        listNum: 2,
        listName: "잔류",
        listContent: """
            금요일 일과가 모두 끝나고
            8시 30분 이후부터9시 30분까지 귀가하고
            일요일 6시 30분 부터 9시 30분까지 귀사해야 합니다.

            혹시나 개인 일정으로 부득이하기 금요일이 아닌, 토요일
            또는 일요일에 귀가해야 하는 학생들은 사감 선생님께
            말씀부탁드립니다.
            """)

    var body: some View {
        VStack(spacing: 12) {
            remainApplyListCellView(list: dummy1, applyType: .friday)

            remainApplyListCellView(list: dummy2, applyType: .saturday)

            remainApplyListCellView(list: dummy3, applyType: .stay)
        }
        .environmentObject(uiState)
    }

    @ViewBuilder
    // swiftlint:disable function_body_length
    func remainApplyListCellView(list: ApplyDummy, applyType: ApplyType) -> some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    uiState.selectedType = list.listName
                    uiState.selectedNum = list.listNum
                }, label: {
                    HStack {
                        Text(list.listName)
                            .dmsFont(.title(.title2), color: uiState.selectedNum == applyType.rawValue
                                     ? .System.primary : .GrayScale.gray7)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 20)

                        if uiState.isAlreadyApplied == true && uiState.appliedStateNum == applyType.rawValue {
                            Text("신청 완료")
                                .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 14)
                                .background(Color.PrimaryVariant.lighten2)
                                .cornerRadius(24)
                        }
                    }

                    Spacer()

                    Image(systemName: uiState.isDetailTapped == true && uiState.selectedNum == applyType.rawValue
                          ? "chevron.up" : "chevron.down")
                        .foregroundColor(uiState.selectedNum == applyType.rawValue ? .System.primary : .GrayScale.gray7)
                        .onTapGesture {
                            uiState.selectedNum = applyType.rawValue
                            uiState.selectedType = list.listName
                            uiState.isDetailTapped.toggle()
                        }
                })
            }
            if uiState.isDetailTapped == true && uiState.selectedNum == applyType.rawValue {
                Text(list.listContent)
                    .multilineTextAlignment(.leading)
                    .dmsFont(.body(.body3), color: .GrayScale.gray9)
                    .padding([.horizontal, .bottom], 20)
            }
        }
        .background(Color.System.surface)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 1)
                .stroke(uiState.selectedNum == applyType.rawValue ?
                        Color.System.primary : .clear, lineWidth: 1.5)
        )
        .padding(.bottom, 12)
        .dmsShadow(style: .surface)
    }
    // swiftlint:enable function_body_length
}

enum ApplyType: Int {
    case friday = 0
    case saturday
    case stay
}

struct ApplyDummy {
    var listNum: Int
    var listName: String
    var listContent: String
}
