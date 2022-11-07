import SwiftUI
import DesignSystem

public struct NoticeOrderButton: View {
    var text: String
    var color: Color
    var action: () -> Void

    public init(
        text: String = "",
        color: Color = .blue,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
        }
        .buttonStyle(NoticeOrderButtonStyle())
    }
}

public struct NoticeOrderButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        return AnyView(OutlinedButton(configuration: configuration, color: .GrayScale.gray6))
    }
}

// MARK: - Outlined
extension NoticeOrderButtonStyle {
    struct OutlinedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .padding(.vertical, 8.5)
                .padding(.horizontal, 16)
                .dmsFont(.button(.default))
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
