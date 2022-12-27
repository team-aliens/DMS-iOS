import DesignSystem
import Utility
import SwiftUI

struct StudyRoomListView: View {
    @StateObject var viewModel: StudyRoomListViewModel

    init(
        viewModel: StudyRoomListViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    if viewModel.isStudyRoomTime {
                        StudyRoomNoticeView(text: viewModel.rangeString)
                    }

                    LazyVStack {
                        Spacer()
                            .frame(height: 10)

                        ForEach(viewModel.studyRoomList, id: \.self) { studyRoomList in
                                studyRoomListCellView(
                                    name: studyRoomList.name,
                                    floor: studyRoomList.floor,
                                    inUseHeadcount: studyRoomList.inUseHeadcount,
                                    totalAvailableSeat: studyRoomList.totalAvailableSeat,
                                    availableGrade: studyRoomList.availableGrade,
                                    availableSex: studyRoomList.availableSex.sexType()
                                )
                                .padding(.top, 5)
                                .listRowInsets(EdgeInsets())
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
            }
        }
    }

    @ViewBuilder
    func studyRoomListCellView(
        name: String,
        floor: Int,
        inUseHeadcount: Int,
        totalAvailableSeat: Int,
        availableGrade: Int,
        availableSex: String
    ) -> some View {
        ZStack {
            Color.System.surface
                .cornerRadius(6)
            VStack(alignment: .leading, spacing: 18) {
                HStack(spacing: 14) {
                    Text("\(floor)층")
                        .dmsFont(.body(.body3), color: .System.primary)

                    Text(name)
                        .dmsFont(.body(.body3), color: .System.backgroundTitle)

                    Spacer()

                    Text("\(inUseHeadcount)/\(totalAvailableSeat)")
                        .dmsFont(.body(.body3), color: .GrayScale.gray5)
                }

                Text("\(availableGrade)학년 \(availableSex)")
                    .dmsFont(.body(.body3), color: .System.primary)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
        }
        .frame(height: 68)
        .dmsShadow(style: .surface)
    }
}
