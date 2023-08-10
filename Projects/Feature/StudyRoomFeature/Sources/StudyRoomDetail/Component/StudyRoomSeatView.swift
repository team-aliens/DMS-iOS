import DesignSystem
import SwiftUI

extension StudyRoomDetailView {

    @ViewBuilder
    func studyRoomSeatView() -> some View {
        VStack {
            Spacer()
                .frame(height: 30)

            studyRoomSeatTypeView()

            Spacer()
                .frame(height: 15)

            ZStack {
                HStack {
                    Text(viewModel.studyRoomDetail?.westDescription ?? "서")
                        .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                        .rotationEffect(.degrees(-90))
                        .fixedSize()
                        .frame(width: 22, height: 100)
                        .padding(.leading, 8)

                    Spacer()

                    VStack(alignment: .center) {
                        Text(viewModel.studyRoomDetail?.northDescription ?? "북")
                            .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                            .padding(.top, 8)

                        Spacer()

                        Text(viewModel.studyRoomDetail?.southDescription ?? "남")
                            .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                            .padding(.bottom, 8)
                    }

                    Spacer()

                    Text(viewModel.studyRoomDetail?.eastDescription ?? "동")
                        .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                        .rotationEffect(.degrees(90))
                        .fixedSize()
                        .frame(width: 22, height: 100)
                        .padding(.trailing, 8)
                }

                studyRoomSeatDetailView()
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
