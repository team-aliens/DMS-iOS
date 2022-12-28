import DesignSystem
import DomainModule
import Utility
import SwiftUI

struct StudyRoomListCellView: View {
    var studyRoomEntity: StudyRoomEntity

    var body: some View {
        ZStack {
            Color.System.surface
                .cornerRadius(6)

            VStack(alignment: .leading, spacing: 18) {
                HStack(spacing: 14) {
                    Text("\(studyRoomEntity.floor)층")
                        .dmsFont(.body(.body3), color: .System.primary)

                    Text(studyRoomEntity.name)
                        .dmsFont(.body(.body3), color: .System.backgroundTitle)

                    Spacer()

                    Text("\(studyRoomEntity.inUseHeadcount)/\(studyRoomEntity.totalAvailableSeat)")
                        .dmsFont(.body(.body3), color: .GrayScale.gray5)
                }

                Text("\(studyRoomEntity.availableGrade)학년 \(studyRoomEntity.availableSex.displayString())")
                    .dmsFont(.body(.body3), color: .System.primary)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
        }
        .frame(height: 68)
        .dmsShadow(style: .surface)
    }
}
