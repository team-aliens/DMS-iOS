import DesignSystem
import SwiftUI

struct SelectStudentView: View {
    @Binding var text: String

    public init(text: Binding<String>) {
        _text = text
    }
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 48)
                .dmsShadow(style: .surface)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")

                        Divider()
                            .padding(.leading, 14)
                        
                        TextField("", text: $text)
                            .dmsFont(.body(.body2), color: .GrayScale.gray10)
                            .padding(.leading, 16)
                        
                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark")
                        })
                    }
                )
                .padding(.horizontal, 24)

            ScrollView(showsIndicators: false) {
                Circle()
            }
            .padding(.horizontal, 24)
            .border(.blue)

            DMSWideButton(text: "동행자 선택", color: .PrimaryVariant.primary)
                .padding(.top, 24)
                .padding(.horizontal, 24)
        }
    }
}
