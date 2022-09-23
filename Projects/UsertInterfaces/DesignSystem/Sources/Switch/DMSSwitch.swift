import SwiftUI

public struct DMSSwitch: View {
    @Binding var isOn: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(.switch)
            .tint(.blue) // TODO: Primary Color
    }
}

struct DMSSwitch_Previews: PreviewProvider {
    static var previews: some View {
        DMSSwitch(isOn: .constant(true))
    }
}
