import SwiftUI

public struct DMSButtonStyle: ButtonStyle {
    public enum Style {
        case contained
        case shortPaddingContained
        case outlined
        case shortPaddingOutlined
        case text
        case underline
        case rounded
    }

    var style: Style
    var color: Color

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .contained:
            return AnyView(ContainedButton(configuration: configuration, color: color))

        case .shortPaddingContained:
            return AnyView(ShortPaddingContainedButton(configuration: configuration, color: color))

        case .outlined:
            return AnyView(OutlinedButton(configuration: configuration, color: color))

        case .shortPaddingOutlined:
            return AnyView(ShortPaddingOutlinedButton(configuration: configuration, color: color))

        case .text:
            return AnyView(TextButton(configuration: configuration, color: color))

        case .underline:
            return AnyView(UnderlineButton(configuration: configuration, color: color))

        case .rounded:
            return AnyView(RoundedButton(configuration: configuration, color: color))
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
                .dmsFont(.etc(.button))
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

// MARK: - ShortPaddingContained
extension DMSButtonStyle {
    struct ShortPaddingContainedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .padding(.vertical, 8.5)
                .padding(.horizontal, 16)
                .dmsFont(.etc(.button))
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
                .dmsFont(.etc(.button))
                .background(.clear)
                .foregroundColor(color)
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

// MARK: - ShortPaddingOutlined
extension DMSButtonStyle {
    struct ShortPaddingOutlinedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .padding(.vertical, 8.5)
                .padding(.horizontal, 16)
                .dmsFont(.etc(.button))
                .background(.clear)
                .foregroundColor(color)
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
                .dmsFont(
                    .etc(.button))
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
                .dmsFont(.etc(.button))
                .foregroundColor(color)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(color)
                        .frame(height: 1)
                        .offset(y: 1)
                }
                .opacity(isEnabled ?
                         configuration.isPressed ? 0.7 : 1.0 :
                            0.5)
        }
    }
}

 // MARK: - Rounded
extension DMSButtonStyle {
    struct RoundedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        var containerColor: Color {
            switch color {
            case .System.primary, .PrimaryVariant.primary:
                return .System.primaryContainer

            case .System.error, .ErrorVariant.error:
                return .System.errorContainer

            case .System.surfaceTitle, .GrayScale.gray6:
                return .GrayScale.gray2

            default:
                return .GrayScale.gray1
            }
        }

        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .dmsFont(.etc(.button))
                .background(containerColor)
                .foregroundColor(color)
                .clipShape(Capsule())
                .opacity(
                    isEnabled ?
                        configuration.isPressed ? 0.7 : 1.0 :
                        0.5
                )
        }
    }
}
