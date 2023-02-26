import SwiftUI
import StudyRoomFeature
import RemainApplyFeature
import DesignSystem

struct ApplyListCellView: View {
    @EnvironmentObject var studyState: StudyRoomStateModel
    @EnvironmentObject var remainState: RemainStateModel
    var name: String
    var content: String
    var buttonTitle: String
    var state: String
    var onTapped: (String) -> Void

    init(
        name: String,
        content: String,
        buttonTitle: String,
        state: String,
        onTapped: @escaping (String) -> Void
    ) {
        self.name = name
        self.content = content
        self.buttonTitle = buttonTitle
        self.state = state
        self.onTapped = onTapped
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text(name)
                    .dmsFont(.title(.title2), color: .GrayScale.gray7)
                    .frame(height: 32)
                    .padding(.vertical, 20)
                    .padding(.leading, 20)

                Spacer()

                Text(name == "자습실" ? studyState.appliedState : remainState.appliedState)
                    .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                    .frame(height: 22)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 14)
                    .background((studyState.appliedState.isEmpty && remainState.appliedState.isEmpty)
                                ? .clear : Color.PrimaryVariant.lighten2)
                    .cornerRadius(24)
                    .padding(.trailing, 16)
                    .padding(.top, -2)
            }

            Text(content)
                .dmsFont(.body(.body3), color: .GrayScale.gray9)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)

            DMSWideButton(
                text: buttonTitle,
                color: .PrimaryVariant.primary,
                action: {
                    onTapped(name)
                }
            )
            .padding(20)
        }
        .environmentObject(studyState)
        .environmentObject(remainState)
        .background(Color.System.surface)
        .cornerRadius(10)
        .dmsShadow(style: .surface)
    }
}
