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
    func dmsStyle(_ style: DMSButtonStyle.Style, color: Color) -> some View {
        self.buttonStyle(DMSButtonStyle(style: style, color: color))
    }
}

// MARK: - Contained
extension DMSButtonStyle {
    struct ContainedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .dmsFont(.text(.small)) // TODO: 디자인상으로 폰트 적용될 시 수정
                .background(color)
                .foregroundColor(.GrayScale.gray1)
                .cornerRadius(5)
                .opacity(
                    isEnabled ?
                        configuration.isPressed ? 0.7 : 1.0 :
                        0.5
                )
        }
    }
}

// MARK: - Outlined
extension DMSButtonStyle {
    struct OutlinedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .dmsFont(.text(.small)) // TODO: 디자인상으로 폰트 적용될 시 수정
                .background(.clear)
                .foregroundColor(.GrayScale.gray1)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(color, lineWidth: 1)
                }
                .opacity(
                    isEnabled ?
                        configuration.isPressed ? 0.7 : 1.0 :
                        0.5
                )
        }
    }
}

// MARK: - Text
extension DMSButtonStyle {
    struct TextButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .dmsFont(.text(.small)) // TODO: 디자인상으로 폰트 적용될 시 수정
                .foregroundColor(color)
                .opacity(
                    isEnabled ?
                        configuration.isPressed ? 0.7 : 1.0 :
                        0.5
                )
        }
    }
}

// MARK: - Underline
extension DMSButtonStyle {
    struct UnderlineButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .dmsFont(.text(.small)) // TODO: 디자인상으로 폰트 적용될 시 수정
                .foregroundColor(color)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(color)
                        .frame(height: 1)
                        .offset(y: 1)
                }
                .opacity(
                    isEnabled ?
                    configuration.isPressed ? 0.7 : 1.0 :
                        0.5
                )
        }
    }
}
