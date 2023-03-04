import SwiftUI

public struct DMSFont: ViewModifier {
    public var style: DMSFontStyle

    init(style: DMSFontStyle) {
        self.style = style
        switch style {
        case let .headline(font as DMSFontable),
            let .body(font as DMSFontable),
            let .etc(font as DMSFontable),
            let .title(font as DMSFontable):
            if !UIFont.fontNames(forFamilyName: "Noto Sans KR").contains("NotoSansKR-\(font.weight.rawValue)"),
                let url = Bundle.module.url(forResource: "NotoSansKR-\(font.weight.rawValue).otf", withExtension: nil) {
                CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
            }
        }
    }

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
