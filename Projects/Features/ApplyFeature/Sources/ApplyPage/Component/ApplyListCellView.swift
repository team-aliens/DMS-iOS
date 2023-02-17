import SwiftUI
import DesignSystem

struct ApplyListCellView: View {
    var listName: String
    var listContent: String
    var buttonTitle: String
    var currentState: String
    var body: some View {
        ZStack {
            Color.System.surface
                .cornerRadius(10)
            VStack(alignment: .leading) {
                HStack {
                    Text(listName)
                        .dmsFont(.title(.title2), color: .GrayScale.gray7)
                        .frame(height: 32)
                        .padding(.vertical, 20)
                        .padding(.leading, 20)
                    Spacer()
                    Text(currentState)
                        .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                        .frame(height: 34)
                        .padding(.horizontal, 14)
                        .background(Color.PrimaryVariant.lighten2)
                        .cornerRadius(24)
                        .padding(.trailing, 16)
                }
                Text(listContent)
                    .dmsFont(.body(.body3), color: .GrayScale.gray9)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
                    .padding(.leading, 20)
                    .padding(.trailing, 29.48)
                DMSWideButton(
                    text: buttonTitle,
                    color: .PrimaryVariant.primary)
                .padding(20)
            }
        }
        .frame(height: 206)
        .dmsShadow(style: .surface)
    }
}
