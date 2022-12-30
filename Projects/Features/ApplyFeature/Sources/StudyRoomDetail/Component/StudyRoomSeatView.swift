import DesignSystem
import DomainModule
import SwiftUI
import Utility

extension StudyRoomDetailView {

    @ViewBuilder
    func studyRoomSeatView() -> some View {
        VStack {
            Spacer()
                .frame(height: 30)

            studyRoomSeatTypeView()

            Spacer()
                .frame(height: 15)

            HStack {
                Text(viewModel.studyRoomDetail?.westDescription ?? "동")
                    .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                    .rotationEffect(.degrees(-90))
                    .padding(.leading, 8)

                VStack(alignment: .center) {
                    Text(viewModel.studyRoomDetail?.northDescription ?? "북")
                        .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                        .padding(.top, 8)

                    studyRoomSeatDetailView()

                    Text(viewModel.studyRoomDetail?.southDescription ?? "ska")
                        .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                        .padding(.bottom, 8)

                }

                Text(viewModel.studyRoomDetail?.eastDescription ?? "서")
                    .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                    .rotationEffect(.degrees(90))
                    .padding(.trailing, 8)

            }
            .background {
                Color.System.surface
                    .cornerRadius(20)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        Color.PrimaryVariant.primary,
                        lineWidth: 1
                    )
            }
            .dmsShadow(style: .surface)

        }
    }

}
