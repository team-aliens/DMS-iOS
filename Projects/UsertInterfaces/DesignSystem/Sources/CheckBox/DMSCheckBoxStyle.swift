import SwiftUI

public struct DMScheckboxStyle: ToggleStyle {

    public func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .PrimaryVariant.primary : .GrayScale.gray5)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}
