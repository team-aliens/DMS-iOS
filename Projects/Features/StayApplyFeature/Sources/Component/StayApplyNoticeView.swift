import DesignSystem
import DomainModule
import SwiftUI

struct StayApplyNoticeView: View {
    let notice: String

    var body: some View {
        HStack(spacing: 16.95) {
            Image(systemName: "megaphone")
                .foregroundColor(.PrimaryVariant.primary)
                .padding(.top, 15.13)
                .padding(.bottom, 16.78)
                .padding(.leading, 24.94)

            Text(notice)
                .dmsFont(.body(.body3), color: .GrayScale.gray6)
                .padding(.trailing, 20)
        }
        .background(Color.System.surface)
        .cornerRadius(100)
        .padding(.top, 11)
        .padding(.bottom, 30)
        .dmsShadow(style: .surface)
    }
}
