import SwiftUI

public struct DMSShadow: ViewModifier {
    public var style: DMSShadowStyle
    @Environment(\.colorScheme) var colorScheme

    public func body(content: Content) -> some View {
        switch style {
        case .surface:
            content
                .shadow(
                    color: colorScheme == .dark ? .GrayScale.gray3.opacity(0.5) : .GrayScale.gray3.opacity(0.8),
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

        case .mealCarousel:
            content
                .shadow(
                    color: colorScheme == .dark ? .GrayScale.gray9.opacity(0.08) : .GrayScale.gray9.opacity(0.1),
                    blur: 15
                )

        case .tabbar:
            content
                .shadow(
                    color: colorScheme == .dark ? .GrayScale.gray5.opacity(0.14) : .GrayScale.gray5.opacity(0.20),
                    y: 1,
                    blur: 20
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
