import SwiftUI

public struct DMSCheckBox: View {
    @Binding var isOn: Bool

    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(DMScheckboxStyle())
    }
}

struct DMSCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        DMSCheckBox(isOn: .constant(true))
            .padding()
    }
}
