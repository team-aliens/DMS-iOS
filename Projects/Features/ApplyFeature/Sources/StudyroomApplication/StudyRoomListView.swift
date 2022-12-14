import DesignSystem
import DomainModule
import Utility
import SwiftUI

struct StudyRoomListView: View {
    @StateObject var viewModel: StudyRoomListViewModel
    private let studyRoomDetailComponent: StudyRoomDetailComponent
    @Environment(\.tabbarHidden) var tabbarHidden

    init(
        viewModel: StudyRoomListViewModel,
        studyRoomDetailComponent: StudyRoomDetailComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.studyRoomDetailComponent = studyRoomDetailComponent
    }

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    if viewModel.isStudyRoomTime {
                        StudyRoomNoticeView(text: viewModel.rangeString)
                    }
                    LazyVStack(spacing: 16) {
                        Spacer()
                            .frame(height: 10)
                        ForEach(viewModel.studyRoomList, id: \.self) { studyRoomList in
                            Button {
                                viewModel.isNavigateDetail.toggle()
                                viewModel.studyRoomDetail = studyRoomList
                            } label: {
                                StudyRoomListCellView(studyRoomEntity: studyRoomList)
                                    .padding(.top, 5)
                                    .padding(.bottom, 10)
                            }
                        }
                        .padding(.horizontal, 24)

                        Spacer()
                            .frame(height: 110)
                    }
                }
                .navigationTitle("자습실 신청")
                .navigationBarTitleDisplayMode(.inline)
                .dmsBackground()
                .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
                .onAppear {
                    viewModel.fetchStudyRoomList()
                    viewModel.fetchStudyAvailableTime()
                }
                .onChange(of: viewModel.isNavigateDetail) { newValue in
                    withAnimation {
                        tabbarHidden.wrappedValue = newValue
                    }
                }
                .navigate(
                    to: studyRoomDetailComponent.makeView(studyRoomEntity: viewModel.studyRoomDetail),
                    when: $viewModel.isNavigateDetail
                )
            }
        }
    }
}
