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
                if self.isDisabeld {
                    Image(systemName: self.isOn ? "largecircle.fill.circle" : "circle")
                        .clipShape(Circle())
                        .foregroundColor(self.isOn ? Color.PrimaryVariant.lighten1 : Color.GrayScale.gray3)
                } else {
                    Image(systemName: self.isOn ? "largecircle.fill.circle" : "circle")
                        .clipShape(Circle())
                        .foregroundColor(self.isOn ? Color.PrimaryVariant.primary : Color.GrayScale.gray5)
                }
            }
        }.disabled(isDisabeld)
    }
}

struct DMSRadioButton_Previews: PreviewProvider {
    static var previews: some View {
        DMSRadioButton(isOn: .constant(true))
            .if(true) {
                $0.foregroundColor(Color.PrimaryVariant.primary)
            }
    }
}

public extension View {
    func `if`<T: View>(
        _ condition: Bool,
        transform: (Self) -> T
    ) -> some View {
        Group {
            if condition { transform(self) } else { self }
        }
    }

    func `if`<T: View>(
        _ condition: Bool,
        true trueTransform: (Self) -> T,
        false falseTransform: (Self) -> T
    ) -> some View {
        Group {
            if condition { trueTransform(self) } else { falseTransform(self) }
        }
    }
}
