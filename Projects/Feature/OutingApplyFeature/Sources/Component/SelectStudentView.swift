import DesignSystem
import SwiftUI

struct SelectStudentView: View {
    @Binding var text: String

    public init(text: Binding<String>) {
        _text = text
    }
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.vertical, 15)

                Divider()
                    .padding(.leading, 14)

                TextField("", text: $text)
                    .dmsFont(.body(.body2), color: .GrayScale.gray10)
                    .padding(.leading, 16)
                    .padding(.vertical, 15)

                Button(action: {
                    text = ""
                }, label: {
                    Image(systemName: "xmark")
                })
                .padding(.vertical, 18)
            }
            .padding(.horizontal, 22)

            ScrollView(showsIndicators: false) {
                Circle()
            }
        }
    }
}
