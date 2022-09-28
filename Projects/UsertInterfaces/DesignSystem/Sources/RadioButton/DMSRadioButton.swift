import SwiftUI

public struct DMSRadioButton: View {

    @Binding var isOn: Bool
    @Binding var isDisabeld: Bool

    let id: String
    let size: CGFloat
    let callback: (String) -> Void

    public init(
        isOn: Binding<Bool> = .constant(false),
        isDisabled: Binding<Bool> = .constant(false),
        id: String,
        size: CGFloat = 20,
        callback: @escaping (String) -> Void
    ) {
        self._isOn = isOn
        self._isDisabeld = isDisabled
        self.id = id
        self.size = size
        self.callback = callback
    }

    public var body: some View {
        Button {
            self.isOn.toggle()
            self.callback(self.id)
        } label: {
            HStack(alignment: .center) {
                if self.isDisabeld {
                    Image(systemName: self.isOn ? "largecircle.fill.circle" : "circle")
                        .clipShape(Circle())
                        .foregroundColor(self.isOn ? Color.PrimaryVariant.lighten1 : Color.GrayScale.gray3)
                        .disabled(isDisabeld)
                } else {
                    Image(systemName: self.isOn ? "largecircle.fill.circle" : "circle")
                        .clipShape(Circle())
                        .foregroundColor(self.isOn ? Color.PrimaryVariant.primary : Color.GrayScale.gray5)
                        .disabled(isDisabeld)
                }
            }
        }
    }
}

struct DMSRadioButton_Previews: PreviewProvider {
    static var previews: some View {
        DMSRadioButton(
            id: "asdf",
            callback: { _ in }
        )
    }
}
