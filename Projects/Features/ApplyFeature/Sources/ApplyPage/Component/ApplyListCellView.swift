import SwiftUI
import StudyRoomFeature
import StayApplyFeature
import DesignSystem

struct ApplyListCellView: View {
    @StateObject var viewModel: ApplyPageViewModel
    var name: String
    var content: String
    var buttonTitle: String
    var state: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name)
                    .dmsFont(.title(.title2), color: .GrayScale.gray7)
                    .frame(height: 32)
                    .padding(.vertical, 20)
                    .padding(.leading, 20)
                Spacer()
                Text(state)
                    .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                    .frame(height: 34)
                    .padding(.horizontal, 14)
                    .background(Color.PrimaryVariant.lighten2)
                    .cornerRadius(24)
                    .padding(.trailing, 16)
            }
            Text(content)
                .dmsFont(.body(.body3), color: .GrayScale.gray9)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .padding(.leading, 20)
                .padding(.trailing, 29.48)
            DMSWideButton(
                text: buttonTitle,
                color: .PrimaryVariant.primary) {
                    if name == "자습실" {
                        viewModel.isNavigateToStudy.toggle()
                    } else {
                        viewModel.isNavigateToStay.toggle()
                    }
                }
                .padding(20)
        }
        .background(Color.System.surface)
        .cornerRadius(10)
        .frame(height: 206)
        .dmsShadow(style: .surface)
    }
}
