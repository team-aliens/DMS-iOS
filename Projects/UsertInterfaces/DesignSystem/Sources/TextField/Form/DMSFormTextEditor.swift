import SwiftUI

public struct DMSFormTextEditor: View {
    var placeholder: String
    @Binding var text: String
    var minHeight: CGFloat
    @FocusState var isFocused: Bool

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        minHeight: CGFloat = 220
    ) {
        self.placeholder = placeholder
        _text = text
        self.minHeight = minHeight
        UITextView.appearance().backgroundColor = .clear
    }

    public var body: some View {
        VStack {
            ScrollView {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(Color.GrayScale.gray4)

                    TextEditor(text: $text)
                        .dmsFont(.body(.body2), color: .GrayScale.gray6)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 15)
                        .frame(minHeight: minHeight, alignment: .leading)
                        .cornerRadius(4)

                    Text(placeholder)
                        .dmsFont(.body(.body2), color: .GrayScale.gray5)
                        .padding(.horizontal, 21)
                        .padding(.vertical, 21)
                        .opacity(text.isEmpty ? 1 : 0)
                        .onTapGesture {
                            isFocused = true
                        }
                }
            }
        }
    }
}

struct DMSFormTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        DMSFormTextEditor(text: .constant(""))
    }
}
