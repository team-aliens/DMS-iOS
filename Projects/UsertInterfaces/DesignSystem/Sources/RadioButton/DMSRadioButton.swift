import SwiftUI

public struct DMSRadioButton: View {

    @Binding var isOn: Bool
    @Binding var isDisabeld: Bool

    public init(
        isOn: Binding<Bool> = .constant(false),
        isDisabled: Binding<Bool> = .constant(false)
    ) {
        self._isOn = isOn
        self._isDisabeld = isDisabled
    }

    public var body: some View {
        Button {
            self.isOn.toggle()
        } label: {
            HStack(alignment: .center) {
                Image(systemName: self.isOn ? "largecircle.fill.circle" : "circle")
                    .clipShape(Circle())
                    .if(isDisabeld) {
                        $0.foregroundColor(self.isOn ? Color.PrimaryVariant.lighten1 : Color.GrayScale.gray3)
                    } false: {
                        $0.foregroundColor(self.isOn ? Color.PrimaryVariant.primary : Color.GrayScale.gray5)
                    }
            }
        }.disabled(isDisabeld)
    }
}

struct DMSRadioButton_Previews: PreviewProvider {
    static var previews: some View {
        DMSRadioButton(isOn: .constant(true))
    }
}
