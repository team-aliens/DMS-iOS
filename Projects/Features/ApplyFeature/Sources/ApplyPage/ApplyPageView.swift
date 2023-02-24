import StudyRoomFeature
import RemainApplyFeature
import SwiftUI

struct ApplyPageView: View {
    @StateObject var viewModel: ApplyPageViewModel
    @EnvironmentObject var studyState: StudyRoomStateModel
    @EnvironmentObject var remainState: RemainStateModel
    @Environment(\.tabbarHidden) var tabbarHidden
    private let studyRoomListComponent: StudyRoomListComponent
    private let remainApplyComponent: RemainApplyComponent

    init(
        viewModel: ApplyPageViewModel,
        studyRoomListComponent: StudyRoomListComponent,
        remainApplyComponent: RemainApplyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.studyRoomListComponent = studyRoomListComponent
        self.remainApplyComponent = remainApplyComponent
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 1)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 30) {
                        Spacer()
                            .frame(height: 5)

                        applyListCellView(
                            viewModel: viewModel,
                            name: "자습실",
                            content: """
            자습실 사용이 필요한 경우, 자습실 신청을 통해서 원하는 자리를 신청해 보세요.
            """,
                            buttonTitle: "자습실 신청하기",
                            state: "2층 자습실")

                        applyListCellView(
                            viewModel: viewModel,
                            name: "잔류",
                            content: """
        주말 기숙사 잔류 여부를 확인하고, 잔류 신청을 통해서 잔류 또는 귀가를 신청해 보세요.
        """,
                            buttonTitle: "잔류 신청하기",
                            state: "금요 귀가")
                    }
                    .padding(.horizontal, 24)
                }
            }
            .navigationTitle("신청")
            .navigationBarTitleDisplayMode(.inline)
            .dmsBackground()
            .onChange(of: viewModel.isNavigateToStudy) { newValue in
                withAnimation {
                    tabbarHidden.wrappedValue = newValue
                }
            }
            .onChange(of: viewModel.isNavigateToRemain) { newValue in
                withAnimation {
                    tabbarHidden.wrappedValue = newValue
                }
            }
            .navigate(
                to: studyRoomListComponent.makeView(),
                when: $viewModel.isNavigateToStudy
            )
            .navigate(
                to: remainApplyComponent.makeView(),
                when: $viewModel.isNavigateToRemain
            )
        }
    }

    @ViewBuilder
    func applyListCellView(
        viewModel: ApplyPageViewModel,
        name: String,
        content: String,
        buttonTitle: String,
        state: String?) -> some View {
            ApplyListCellView(
                viewModel: viewModel,
                name: name,
                content: content,
                buttonTitle: buttonTitle,
                state: state ?? "")
        }
}
