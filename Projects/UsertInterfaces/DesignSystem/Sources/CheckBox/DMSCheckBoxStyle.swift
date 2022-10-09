import SwiftUI

public struct DMScheckboxStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled: Bool

    public func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .PrimaryVariant.primary : .GrayScale.gray5)
                .opacity(isEnabled ? 1.0 : 0.5)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}
