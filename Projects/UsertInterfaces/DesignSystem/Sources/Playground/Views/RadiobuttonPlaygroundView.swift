import SwiftUI

struct RadiobuttonPlaygroundView: View {
    @State var isOn = false
    var body: some View {
        ScrollView {
            VStack {
                DMSRadioButton(isOn: $isOn)

                DMSRadioButton(isOn: $isOn)
                    .disabled(true)
            }
            .padding()
        }
    }
}

struct RadiobuttonPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        RadiobuttonPlaygroundView()
    }
}
