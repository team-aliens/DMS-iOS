import DesignSystem
import StudyRoomFeature
import StayApplyFeature
import SwiftUI

struct ApplyPageView: View {
    @StateObject var viewModel: ApplyPageViewModel
    private let studyRoomListComponent: StudyRoomListComponent
    private let stayApplyComponent: StayApplyComponent
    init(
        viewModel: ApplyPageViewModel,
        studyRoomListComponent: StudyRoomListComponent,
        stayApplyComponent: StayApplyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.studyRoomListComponent = studyRoomListComponent
        self.stayApplyComponent = stayApplyComponent
    }
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
//                    Spacer()
//                        .frame(height: 20)
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
                    //                    ApplyListCellView(
                    //                        listName: "자습실",
                    //                        listContent: """
                    //    자습실 사용이 필요한 경우, 자습실 신청을 통해서 원하는 자리를 신청해 보세요.
                    //    """,
                    //                        buttonTitle: "자습실 신청하기",
                    //                        currentState: "2층 자습실")
                    //                    ApplyListCellView(
                    //                        listName: "잔류",
                    //                        listContent: """
                    //주말 기숙사 잔류 여부를 확인하고, 잔류 신청을 통해서 잔류 또는 귀가를 신청해 보세요.
                    //""",
                    //                        buttonTitle: "잔류 신청하기",
                    //                        currentState: "금요 귀가")
                }
                .padding(.horizontal, 24)
                .navigationTitle("신청")
                .navigationBarTitleDisplayMode(.inline)
                .dmsBackground()
            }
        }
    }
    @ViewBuilder
    func applyListCellView(viewModel: ApplyPageViewModel, name: String, content: String, buttonTitle: String, state: String) -> some View {
        NavigationView {
//            ZStack {
//                Color.System.surface
//                    .cornerRadius(10)
//                VStack(alignment: .leading) {
//                    HStack {
//                        Text(name)
//                            .dmsFont(.title(.title2), color: .GrayScale.gray7)
//                            .frame(height: 32)
//                            .padding(.vertical, 20)
//                            .padding(.leading, 20)
//                        Spacer()
//                        Text(state)
//                            .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
//                            .frame(height: 34)
//                            .padding(.horizontal, 14)
//                            .background(Color.PrimaryVariant.lighten2)
//                            .cornerRadius(24)
//                            .padding(.trailing, 16)
//                    }
//                    Text(content)
//                        .dmsFont(.body(.body3), color: .GrayScale.gray9)
//                        .multilineTextAlignment(.leading)
//                        .frame(alignment: .leading)
//                        .padding(.leading, 20)
//                        .padding(.trailing, 29.48)
//                    DMSWideButton(
//                        text: buttonTitle,
//                        color: .PrimaryVariant.primary) {
//                            if name == "자습실" {
//                                viewModel.isNavigateToStudy.toggle()
//                            } else {
//                                viewModel.isNavigateToStay.toggle()
//                            }
//                        }
//                        .padding(20)
//                }
//            }
//            .frame(height: 206)
//            .dmsShadow(style: .surface)
            ApplyListCellView(
                viewModel: viewModel,
                name: name,
                content: content,
                buttonTitle: buttonTitle,
                state: state)
        }
        .navigate(
            to: studyRoomListComponent.makeView(),
            when: $viewModel.isNavigateToStudy
        )
        .navigate(
            to: stayApplyComponent.makeView(),
            when: $viewModel.isNavigateToStay
        )
    }
}
