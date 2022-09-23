import SwiftUI

public struct DMSButton: View {
    var text: String
    var style: DMSButtonStyle.Style
    var color: Color
    var action: () -> Void

    public init(
        text: String = "",
        style: DMSButtonStyle.Style = .contained,
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
            Text(text)
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
        }
        .buttonStyle(DMSButtonStyle(style: style, color: color))
    }
}

struct DMSButton_Previews: PreviewProvider {
    static var previews: some View {
        DMSButton(text: "Asdf")
    }
}
