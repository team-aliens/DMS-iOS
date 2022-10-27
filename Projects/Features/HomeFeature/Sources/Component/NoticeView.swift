import DesignSystem
import SwiftUI

struct NoticeView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "megaphone")
                .foregroundColor(.PrimaryVariant.primary)
                .padding(.leading, 24)
                .padding(.vertical, 12)

            Text("새로운 공지가 있습니다.")
                .dmsFont(.text(.small), color: .GrayScale.gray6)

            Spacer()

            Image(systemName: "chevron.right")
                .resizable()
                .foregroundColor(.PrimaryVariant.primary)
                .frame(width: 7, height: 12)
                .padding(12)
                .background {
                    Color.PrimaryVariant.lighten2
                        .clipShape(Circle())
                }
                .padding(.trailing, 8)
        }
        .background {
            Color.GrayScale.gray1
        }
        .cornerRadius(100)
        .padding(.horizontal, 24)
        .padding(.top, 12)
        .shadow(
            color: .GrayScale.gray4.opacity(0.24),
            radius: 20,
            y: 1
        )
    }
}
