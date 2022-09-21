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

// MARK: - Contained
extension Button {
    struct ContainedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
        }
    }
}

// MARK: - Outlined
extension Button {
    struct OutlinedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
        }
    }
}

// MARK: - Text
extension Button {
    struct TextButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
        }
    }
}

// MARK: - Underline
extension Button {
    struct UnderlineButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
        }
    }
}
