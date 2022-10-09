import SwiftUI

struct CheckboxPlaygroundView: View {
    @State var isOn = false
    var body: some View {
        ScrollView {
            VStack {
                DMSCheckBox(isOn: $isOn)

                DMSCheckBox(isOn: $isOn)
                    .disabled(true)
            }
        }
    }
}

struct CheckboxPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxPlaygroundView()
    }
}
