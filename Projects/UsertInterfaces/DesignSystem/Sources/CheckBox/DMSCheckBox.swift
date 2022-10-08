import SwiftUI

struct DMSCheckBox: View {
    @State var isChecked: Bool = false

    var title: String
    func toggle() {isChecked = !isChecked}
    var body: some View {
        Button(action: toggle) {
            HStack {
                Image(systemName: isChecked ? "checkmark.circle.fill": "circle")
                Text(title)
            }
        }
    }
}

struct DMSCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        DMSCheckBox(isChecked: true, title: "")
    }
}
