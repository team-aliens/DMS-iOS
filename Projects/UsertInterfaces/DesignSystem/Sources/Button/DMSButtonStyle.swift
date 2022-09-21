import SwiftUI

public struct DMSButtonStyle: ButtonStyle {
    public enum Style {
        case contained
        case outlined
        case text
        case underline
    }

    var style: Style
    var color: Color

    public func makeBody(configuration: Configuration) -> some View {
        VStack {
        }
    }
}

// MARK: - Usage
extension Button {
    func dmsStyle(_ style: DMSButtonStyle.Style, color: Color) -> some View {
        self.buttonStyle(DMSButtonStyle(style: style, color: color))
    }
}
