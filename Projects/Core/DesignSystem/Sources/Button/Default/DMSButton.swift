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
        }
        .buttonStyle(DMSButtonStyle(style: style, color: color))
    }
}

struct DMSButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            DMSButton(text: "Contained")
            DMSButton(text: "Outlined", style: .outlined)
            DMSButton(text: "Text", style: .text)
            DMSButton(text: "Underline", style: .underline)
        }
        .padding()
        .background(Color.GrayScale.gray9)
    }
}
