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
            HStack {
                VStack(alignment: .leading) {
                    ZStack {
                        Text(listName)
                            .dmsFont(.title(.title2), color: .GrayScale.gray7)
                            .frame(height: 32)
                            .padding(.vertical, 20)
                        .padding(.leading, 20)
                        Text(currentState)
                            .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                            .background(Color.PrimaryVariant.lighten2)
                            .frame(width: 92, height: 34)
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
        }
        .frame(height: 206)
        .dmsShadow(style: .surface)
    }
}
