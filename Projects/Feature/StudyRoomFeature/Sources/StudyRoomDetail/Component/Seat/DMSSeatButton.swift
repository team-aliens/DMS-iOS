import SwiftUI
import StudyRoomsDomainInterface

public struct DMSSeatButton: View {
    var text: String
    var style: DMSSeatButtonStyle.Style
    var color: Color
    var isSelected: Bool
    var action: () -> Void

    public init(
        text: String = "",
        style: DMSSeatButtonStyle.Style = .empty,
        color: Color = .blue,
        isSelected: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.color = color
        self.isSelected = isSelected
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
        }
        .buttonStyle(DMSSeatButtonStyle(style: style, color: color, isSelected: isSelected))
    }
}
