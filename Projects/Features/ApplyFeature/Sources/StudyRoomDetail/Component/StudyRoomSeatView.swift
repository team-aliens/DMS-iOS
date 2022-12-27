import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct StudyRoomSeatView: View {
    var detailStudyRoom: DetailStudyRoomEntity

//    @ViewBuilder
//    func StudyRoomSeatView() -> some View {
//        
//    }
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 66)
            HStack {
                Text(detailStudyRoom.westDescription)
                    .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                    .rotationEffect(.degrees(-90))
                    .padding(.leading, 8)

//                Spacer()

                VStack(alignment: .center) {
                    Text(detailStudyRoom.northDescription)
                        .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                        .padding(.top, 8)

                    StudyRoomSeatDetailView(detailStudyRoom: detailStudyRoom)

                    Text(detailStudyRoom.southDescription)
                        .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                        .padding(.bottom, 8)

                }
//                Spacer()

                Text(detailStudyRoom.eastDescription)
                    .dmsFont(.etc(.button), color: Color.PrimaryVariant.lighten1)
                    .rotationEffect(.degrees(90))
                    .padding(.trailing, 8)

            }
            .background {
                Color.GrayScale.gray1
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

    @ViewBuilder
    func studyRoomSeatScrollview() -> some View {

    }
}
