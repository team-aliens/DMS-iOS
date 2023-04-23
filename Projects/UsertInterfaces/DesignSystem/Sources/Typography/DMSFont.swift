import SwiftUI

public struct DMSFont: ViewModifier {
    public var style: DMSFontStyle

    public func body(content: Content) -> some View {
        switch style {
        case let .headline(font):
            return content
                .font(.custom("NotoSansKR-\(font.weight.rawValue)", size: font.size))

        case let .title(font):
            return content
                .font(.custom("NotoSansKR-\(font.weight.rawValue)", size: font.size))

        case let .body(font):
            return content
                .font(.custom("NotoSansKR-\(font.weight.rawValue)", size: font.size))

        case let .etc(font):
            return content
                .font(.custom("NotoSansKR-\(font.weight.rawValue)", size: font.size))
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
