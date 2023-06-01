import SwiftUI

public struct DMSSwitch: View {
    @Binding var isOn: Bool
    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(.switch)
            .tint(isEnabled ? .PrimaryVariant.primary : .PrimaryVariant.lighten1)
    }
}

struct DMSSwitch_Previews: PreviewProvider {
    static var previews: some View {
        DMSSwitch(isOn: .constant(true))
    }
}
