import SwiftUI

public struct DMSRadioButton: View {
    @Binding var isOn: Bool
    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(
        isOn: Binding<Bool>
    ) {
        self._isOn = isOn
    }

    public var body: some View {
        Button {
            self.isOn.toggle()
        } label: {
            ZStack {
                Group {
                    Circle()
                        .stroke(isOn ? Color.PrimaryVariant.primary : .GrayScale.gray5, lineWidth: 2)
                        .frame(width: 20, height: 20)

                    Circle()
                        .fill(isOn ? Color.PrimaryVariant.primary : .clear)
                        .frame(width: 10, height: 10)
                }
                .opacity(isEnabled ? 1.0 : 0.5)
            }
        }
    }
}

struct DMSRadioButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DMSRadioButton(isOn: .constant(true))

            DMSRadioButton(isOn: .constant(false))
        }
    }
}
