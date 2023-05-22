import SwiftUI
import DesignSystem

struct BlockEmailView: View {
    @Binding var email: String

    init(
        email: Binding<String>
    ) {
        _email = email
    }

    var body: some View {
        ZStack {
            Color.GrayScale.gray2
                .ignoresSafeArea()

            HStack {
                VStack(alignment: .leading) {
                    Text("아이디와 일치하는 이메일 입니다")
                        .dmsFont(.body(.body3), color: .GrayScale.gray7)
                        .multilineTextAlignment(.leading)

                    Text(email)
                        .dmsFont(.body(.body3), color: .PrimaryVariant.primary)
                        .multilineTextAlignment(.leading)
                }
                Spacer()

            }
            .padding(.horizontal, 16)
        }
        .frame(height: 68)

    }
}
