import DesignSystem
import DomainModule
import Utility
import SwiftUI

struct StudyRoomListView: View {
    @StateObject var viewModel: StudyRoomListViewModel
    private let studyRoomDetailComponent: StudyRoomDetailComponent
    @Environment(\.tabbarHidden) var tabbarHidden
    @Environment(\.dismiss) var dismiss

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
                Spacer()

                ScrollView(showsIndicators: false) {
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
            }
        }
        .navigationViewStyle(.stack)
    }
}
