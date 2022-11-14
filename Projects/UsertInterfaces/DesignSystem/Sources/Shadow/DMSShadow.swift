import SwiftUI

struct DMSShadow: ViewModifier {
    var style: DMSShadowStyle

    func body(content: Content) -> some View {
        switch style {
        case .surface:
            content
                .shadow(
                    color: .GrayScale.gray3.opacity(0.8),
                    y: 1,
                    blur: 20
                )

        case .button:
            content
                .shadow(
                    color: .GrayScale.gray9.opacity(0.08),
                    y: 2,
                    blur: 16
                )
        }
    }
}

public extension View {
    func dmsShadow(
        style: DMSShadowStyle = .surface
    ) -> some View {
        modifier(DMSShadow(style: style))
    }
}
