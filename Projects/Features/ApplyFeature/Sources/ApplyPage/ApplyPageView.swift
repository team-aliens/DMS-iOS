import StudyRoomFeature
import RemainApplyFeature
import SwiftUI

struct ApplyPageView: View {
    @StateObject var viewModel: ApplyPageViewModel
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

                        ApplyListCellView(
                            name: "자습실",
                            content: """
                            자습실 사용이 필요한 경우, 자습실 신청을 통해서 원하는 자리를 신청해 보세요.
                            """,
                            buttonTitle: "자습실 신청하기",
                            applyState: viewModel.studyRoomState,
                            onTapped: {
                                viewModel.isNavigateToStudy.toggle()
                            }
                        )

                        ApplyListCellView(
                            name: "잔류",
                            content: """
                            주말 기숙사 잔류 여부를 확인하고, 잔류 신청을 통해서 잔류 또는 귀가를 신청해 보세요.
                            """,
                            buttonTitle: "잔류 신청하기",
                            applyState: viewModel.remainState,
                            onTapped: {
                                viewModel.isNavigateToRemain.toggle()
                            }
                        )
                    }
                    .padding(.horizontal, 24)
                }
            }
            .navigationTitle("신청")
            .navigationBarTitleDisplayMode(.inline)
            .dmsBackground()
            .onAppear {
                viewModel.fehtchMyStudyRoomApplicationItems()
                viewModel.fetchMyRemainApplicationItems()
            }
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
            .navigationViewStyle(.stack)
        }
    }
}
