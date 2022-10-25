import SwiftUI
import DesignSystem

struct BlockEmailView: View {
    @Binding var email: String
    @Binding var isShow: Bool

    init(
        email: Binding<String>,
        isShow: Binding<Bool>
    ) {
        _email = email
        _isShow = isShow
    }

    var body: some View {
//        if isShow {
            ZStack {
                Color.GrayScale.gray2
                    .ignoresSafeArea()

                HStack {
                    VStack(alignment: .leading) {
                        Text("아이디와 일치하는 이메일 입니다")
                            .dmsFont(.text(.small), color: .GrayScale.gray7)
                            .multilineTextAlignment(.leading)

                        Text(email)
                            .dmsFont(.text(.small), color: .PrimaryVariant.primary)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()

                }
                .padding(.horizontal, 16)
            }
            .frame(height: 68)

        }
//    }
}
