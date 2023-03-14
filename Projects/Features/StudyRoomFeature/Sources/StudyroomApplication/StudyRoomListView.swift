import DesignSystem
import DomainModule
import Utility
import SwiftUI

struct StudyRoomListView: View {
    @StateObject var viewModel: StudyRoomListViewModel
    private let studyRoomDetailComponent: StudyRoomDetailComponent
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: StudyRoomListViewModel,
        studyRoomDetailComponent: StudyRoomDetailComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.studyRoomDetailComponent = studyRoomDetailComponent
    }

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 1)

            ScrollView {
                if viewModel.isStudyRoomTime {
                    StudyRoomNoticeView(text: viewModel.rangeString)
                }
                LazyVStack(spacing: 16) {
                    Button {
                        viewModel.isShowingBottomSheet.toggle()
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(.PrimaryVariant.primary)
                                .frame(width: 15)
                                .padding(.top, 4)
                                .padding(.trailing, 11)

                            Text("10시 ~ 11시")
                                .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                                .frame(height: 22)

                            Spacer()
                        }
                    }
                    .padding(.vertical, 9)
                    .padding(.leading, 27)

                    ForEach(viewModel.studyRoomList, id: \.self) { studyRoomList in
                        Button {
                            viewModel.isNavigateDetail.toggle()
                            viewModel.studyRoomDetail = studyRoomList
                        } label: {
                            StudyRoomListCellView(studyRoomEntity: studyRoomList)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                        }
                    }
                    .padding(.horizontal, 24)

                    Spacer()
                        .frame(height: 10)
                }
            }
        }
        .refreshable {
            viewModel.refresh()
        }
        .navigationTitle("자습실 신청")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackButton(dismiss: dismiss)
        .dmsBackground()
        .dmsBottomSheet(isShowing: $viewModel.isShowingBottomSheet) {
            DeferView {
                StudyroomTimeListView()
            }
        }
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .onAppear {
            viewModel.onAppear()
        }
        .navigate(
            to: studyRoomDetailComponent.makeView(studyRoomEntity: viewModel.studyRoomDetail),
            when: $viewModel.isNavigateDetail
        )
    }
}
