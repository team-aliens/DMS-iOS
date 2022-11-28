import SwiftUI

struct TextFieldPlaygroundView: View {
    @State var text1 = ""
    @State var text2 = ""
    @State var text3 = ""
    @State var text4 = ""
    @State var text5 = ""
    @State var text6 = ""
    @State var isError1 = false

    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                DMSFloatingTextField("아이디", text: $text1)

                SecureDMSFloatingTextField("비밀번호", text: $text2)

                DMSFloatingTextField(
                    "Error",
                    text: $text3,
                    isError: isError1,
                    errorMessage: "Error Message"
                ) {
                    isError1.toggle()
                }

                DMSFormTextField("제목을 입력해주세요", text: $text5)

                DMSFormTextEditor("내용을 입력해주세요", text: $text6)
            }
            .padding()
        }
    }
}

struct TextFieldPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPlaygroundView()
    }
}
