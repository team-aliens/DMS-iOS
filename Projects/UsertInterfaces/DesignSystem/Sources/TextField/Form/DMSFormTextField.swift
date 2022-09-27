import SwiftUI

public struct DMSFormTextField: View {
    var placeholder: String
    @Binding var text: String

    public init(
        _ placeholder: String = "",
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        _text = text
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .dmsFont(.text(.medium), color: .GrayScale.gray5)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 15)
            }

            TextField("", text: $text)
                .foregroundColor(.GrayScale.gray6)
                .padding(.horizontal, 16)
                .padding(.vertical, 15)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(Color.GrayScale.gray4)
                }
        }
    }
}

struct DMSFormTextField_Previews: PreviewProvider {
    static var previews: some View {
        DMSFormTextField(text: .constant(""))
    }
}
