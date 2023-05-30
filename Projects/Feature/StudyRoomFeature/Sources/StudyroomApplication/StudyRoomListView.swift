import DesignSystem
import UtilityModule
import SwiftUI
import StudyRoomFeatureInterface

struct StudyRoomListView: View {
    @StateObject var viewModel: StudyRoomListViewModel
    private let studyRoomDetailFactory: any StudyRoomDetailFactory
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: StudyRoomListViewModel,
        studyRoomDetailFactory: any StudyRoomDetailFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.studyRoomDetailFactory = studyRoomDetailFactory
    }

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 1)

            ScrollView {
                if !viewModel.rangeString.isEmpty {
                    StudyRoomNoticeView(text: viewModel.rangeString)
                }
                LazyVStack(spacing: 16) {
                    Button {
                        withAnimation {
                            viewModel.isStudyTimeBottomSheet.toggle()
                        }
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(.PrimaryVariant.primary)
                                .frame(width: 15)
                                .padding(.top, 4)
                                .padding(.trailing, 11)

                            Text((viewModel.selectedTimeEntity?.startTime ?? "")
                                 + " ~ " + (viewModel.selectedTimeEntity?.endTime ?? ""))
                                .dmsFont(.etc(.button), color: .PrimaryVariant.primary)

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
            viewModel.onAppear()
        }
        .navigationTitle("자습실 신청")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackButton(dismiss: dismiss)
        .dmsBackground()
        .dmsBottomSheet(
            isShowing: $viewModel.isStudyTimeBottomSheet,
            isGrabberOn: false,
            sheetCornerRadiusValue: 8
        ) {
            DeferView {
                StudyroomTimeListView(viewModel: viewModel)
            }
        }
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .onAppear {
            viewModel.onAppear()
        }
        .navigate(
            to: studyRoomDetailFactory.makeView(
                studyRoomParam: StudyRoomParam(
                    id: viewModel.studyRoomDetail.id,
                    floor: viewModel.studyRoomDetail.floor,
                    name: viewModel.studyRoomDetail.name,
                    availableGrade: viewModel.studyRoomDetail.availableGrade,
                    availableSex: viewModel.studyRoomDetail.availableSex.rawValue,
                    inUseHeadcount: viewModel.studyRoomDetail.inUseHeadcount,
                    totalAvailableSeat: viewModel.studyRoomDetail.totalAvailableSeat,
                    isMine: viewModel.studyRoomDetail.isMine
                ),
                timeSlot: viewModel.timeSlotParam ?? ""
            )
            .eraseToAnyView(),
            when: $viewModel.isNavigateDetail
        )
    }
}
