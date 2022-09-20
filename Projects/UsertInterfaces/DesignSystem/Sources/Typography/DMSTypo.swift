import SwiftUI

public struct DMSTypo: ViewModifier {
    public var style: DMSTypoStyle

    public func body(content: Content) -> some View {
        switch style {
        case let .title(font):
            return content
                .font(.system(size: font.size, weight: font.weight))
        case let .text(font):
            return content
                .font(.system(size: font.size, weight: font.weight))
        }
    }
}

public extension View {
    func dmsTypo(_ style: DMSTypoStyle) -> some View {
        self
            .modifier(DMSTypo(style: style))
    }

    func dmsTypo(_ style: DMSTypoStyle, color: Color) -> some View {
        self
            .dmsTypo(style)
            .foregroundColor(color)
    }
}
