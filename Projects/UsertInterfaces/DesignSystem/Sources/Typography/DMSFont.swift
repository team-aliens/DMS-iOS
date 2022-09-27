import SwiftUI

public struct DMSFont: ViewModifier {
    public var style: DMSFontStyle

    public func body(content: Content) -> some View {
        switch style {
        case let .title(font):
            return content
                .font(.system(size: font.size, weight: font.weight))

        case let .text(font):
            return content
                .font(.system(size: font.size, weight: font.weight))

        case let .button(font):
            return content
                .font(.system(size: font.size, weight: font.weight))
        }
    }
}

public extension View {
    func dmsFont(_ style: DMSFontStyle) -> some View {
        self
            .modifier(DMSFont(style: style))
    }

    func dmsFont(_ style: DMSFontStyle, color: Color) -> some View {
        self
            .dmsFont(style)
            .foregroundColor(color)
    }
}
