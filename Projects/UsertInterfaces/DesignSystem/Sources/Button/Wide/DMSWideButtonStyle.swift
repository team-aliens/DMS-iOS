import SwiftUI

public struct DMSWideButtonStyle: ButtonStyle {
    public enum Style {
        case contained
        case outlined
        case text
        case underline
    }

    var style: Style
    var color: Color

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .contained:
            return AnyView(ContainedButton(configuration: configuration, color: color))

        case .outlined:
            return AnyView(OutlinedButton(configuration: configuration, color: color))

        case .text:
            return AnyView(TextButton(configuration: configuration, color: color))

        case .underline:
            return AnyView(UnderlineButton(configuration: configuration, color: color))
        }
    }
}

// MARK: - Usage
extension Button {
    func dmsStyle(_ style: DMSWideButtonStyle.Style, color: Color) -> some View {
        self.buttonStyle(DMSWideButtonStyle(style: style, color: color))
    }
}

// MARK: - Contained
extension DMSWideButtonStyle {
    struct ContainedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        var opacity: Double {
            isEnabled ?
                configuration.isPressed ? 0.7 :
                    1.0 :
                    0.5
        }
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .dmsFont(.etc(.button))
                .background(color)
                .foregroundColor(.GrayScale.gray1)
                .cornerRadius(5)
                .opacity(opacity)
        }
    }
}

// MARK: - Outlined
extension DMSWideButtonStyle {
    struct OutlinedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        var opacity: Double {
            isEnabled ?
                configuration.isPressed ? 0.7 :
                    1.0 :
                    0.5
        }
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .dmsFont(.etc(.button))
                .background(.clear)
                .foregroundColor(color)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(color, lineWidth: 1)
                }
                .opacity(opacity)
        }
    }
}

// MARK: - Text
extension DMSWideButtonStyle {
    struct TextButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        var opacity: Double {
            isEnabled ?
                configuration.isPressed ? 0.7 :
                    1.0 :
                    0.5
        }
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .dmsFont(.etc(.button))
                .foregroundColor(color)
                .opacity(opacity)
        }
    }
}

// MARK: - Underline
extension DMSWideButtonStyle {
    struct UnderlineButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        var opacity: Double {
            isEnabled ?
                configuration.isPressed ? 0.7 :
                    1.0 :
                    0.5
        }
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .dmsFont(.etc(.button))
                .foregroundColor(color)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(color)
                        .frame(height: 1)
                        .offset(y: 1)
                }
                .opacity(opacity)
        }
    }
}
