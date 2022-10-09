import SwiftUI

public struct DMSRadioButton: View {
    @Binding var isOn: Bool
    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(
        isOn: Binding<Bool> = .constant(false)
    ) {
        self._isOn = isOn
    }

    public var body: some View {
        Button {
            self.isOn.toggle()
        } label: {
            ZStack {
                Circle()
                    .fill(Color.PrimaryVariant.primary)
                    .frame(width: 20, height: 20)
                Circle()
                    .fill(Color.white)
                    .frame(width: 15, height: 15)
                Circle()
                    .fill(Color.PrimaryVariant.primary)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

struct DMSRadioButton_Previews: PreviewProvider {
    static var previews: some View {
        DMSRadioButton(isOn: .constant(true))
    }
}
