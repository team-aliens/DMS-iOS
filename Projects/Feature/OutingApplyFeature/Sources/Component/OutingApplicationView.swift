import DesignSystem
import SwiftUI

struct OutingApplyTextField: View {
    var title: String
    var placeholder: String
    @Binding var text: String

    public init(
        _ title: String = "",
        _ placeholder: String = "",
        _ text: Binding<String>
    ) {
        self.title = title
        self.placeholder = placeholder
        _text = text
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .dmsFont(.body(.body2), color: .GrayScale.gray10)
                .padding(.leading, 1)
                .padding(.bottom, 8)

            TextField(placeholder, text: $text)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .cornerRadius(4)
                .border(Color.GrayScale.gray5, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
}
