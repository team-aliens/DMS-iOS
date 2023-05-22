import SwiftUI

public struct DMSWideButton: View {
    var text: String
    var style: DMSWideButtonStyle.Style
    var color: Color
    var action: () -> Void

    public init(
        text: String = "",
        style: DMSWideButtonStyle.Style = .contained,
        color: Color = .blue,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                Spacer()

                Text(text)
                    .padding(.vertical, 14)

                Spacer()
            }
        }
        .buttonStyle(DMSWideButtonStyle(style: style, color: color))
    }
}

struct DMSWideButton_Previews: PreviewProvider {
    static var previews: some View {
        DMSWideButton(text: "Contained")
    }
}
