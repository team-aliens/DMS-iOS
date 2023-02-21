import DesignSystem
import SwiftUI

struct StayApplyListCellView: View {
    @StateObject var uiState = StayStateModel()

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
            stayApplyListCellView(list: dummy1, applyType: .friday)

            stayApplyListCellView(list: dummy2, applyType: .saturday)

            stayApplyListCellView(list: dummy3, applyType: .stay)
        }
        .environmentObject(uiState)
    }

    @ViewBuilder
    func stayApplyListCellView(list: ApplyDummy, applyType: ApplyType) -> some View {
        HStack {
            Button(action: {
                uiState.currentSelectedType = list.listName
                uiState.currentSelectedNum = list.listNum
                print(uiState.currentSelectedType)
            }, label: {
                Text(list.listName)
                    .dmsFont(.title(.title2),
                             color: uiState.currentSelectedNum == applyType.rawValue
                             ? .System.primary : .GrayScale.gray7)
                    .padding(.vertical, 14)
                    .padding(.leading, 20)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(uiState.currentSelectedNum == applyType.rawValue
                                     ? .System.primary : .GrayScale.gray7)
                    .padding(.vertical, 26.15)
                    .padding(.trailing, 25.32)
            })
        }
        .environmentObject(uiState)
        .background(Color.System.surface)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 1)
                .stroke(uiState.currentSelectedNum == applyType.rawValue ?
                        Color.System.primary : .clear, lineWidth: 1.5)
        )
        .padding(.bottom, 12)
        .dmsShadow(style: .surface)
    }
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
