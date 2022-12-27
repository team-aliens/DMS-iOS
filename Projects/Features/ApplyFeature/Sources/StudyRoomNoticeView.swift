import DesignSystem
import DomainModule
import SwiftUI

struct StudyRoomNoticeView: View {
    let text: String

    var body: some View {
        HStack {
            Image(systemName: "megaphone")
                .foregroundColor(.PrimaryVariant.primary)
                .padding(.leading, 24)
                .padding(.vertical, 13)

            Text(text)
                .dmsFont(.body(.body3), color: .GrayScale.gray6)

            Spacer()
        }
        .background {
            Color.GrayScale.gray1
        }
        .cornerRadius(100)
        .padding(.horizontal, 24)
        .padding(.top, 12)
        .dmsShadow(style: .surface)
    }
}
