import DesignSystem
import SwiftUI

struct ApplyPageView: View {
    @StateObject var viewModel: ApplyPageViewModel
    init(
        viewModel: ApplyPageViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Spacer()
                        .frame(height: 20)
                    ApplyListCellView(
                        listName: "자습실 신청",
                        listContent: """
자습실 사용이 필요한 경우, 자습실 신청을 통해서 원하는 자리를 신청해 보세요.
""",
                        buttonTitle: "자습실 신청하기",
                        currentState: "2층 자습실")
                    ApplyListCellView(
                        listName: "잔류",
                        listContent: """
주말 기숙사 잔류 여부를 확인하고, 잔류 신청을 통해서 잔류 또는 귀가를 신청해 보세요.
""",
                        buttonTitle: "잔류 신청하기",
                        currentState: "금요 귀가")
                }
                .padding(.horizontal, 24)
                .navigationTitle("신청")
                .navigationBarTitleDisplayMode(.inline)
                .dmsBackground()
            }
        }
    }
}
