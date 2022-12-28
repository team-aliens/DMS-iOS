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
                            NavigationLink(
                                destination: studyRoomDetailComponent.makeView(
                                    studyRoomEntity: studyRoomList
                                )
                            ) {
                                StudyRoomListCellView(studyRoomEntity: studyRoomList)
                                    .padding(.top, 5)
                                    .padding(.bottom, 10)
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                }
                .navigationTitle("자습실 신청")
                .navigationBarTitleDisplayMode(.inline)
                .dmsBackground()
                .onAppear {
                    viewModel.fetchStudyRoomList()
                    viewModel.fetchStudyAvailableTime()
                    tabbarHidden.wrappedValue = false
                }
                .onDisappear {
                    tabbarHidden.wrappedValue = true
                }
            }
        }
    }
}
