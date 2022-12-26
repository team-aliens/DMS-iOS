import SwiftUI
import DataMappingModule
import DesignSystem

public struct DMSSeatButton: View {
    var text: String
    var style: SeatStatusType
    var color: Color
    var action: () -> Void

    public init(
        text: String = "",
        style: SeatStatusType = .empty,
        color: Color = .blue,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
        }
        .buttonStyle(DMSSeatButtonStyle(style: style, color: color))
    }
}
