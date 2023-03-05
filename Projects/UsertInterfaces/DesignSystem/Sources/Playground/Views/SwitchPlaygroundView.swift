import SwiftUI

struct SwitchPlaygroundView: View {
    @State var isOn = false
    var body: some View {
        ScrollView {
            VStack {
                DMSSwitch(isOn: $isOn)

                DMSSwitch(isOn: $isOn)
                    .disabled(true)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}

struct SwitchPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchPlaygroundView()
    }
}
