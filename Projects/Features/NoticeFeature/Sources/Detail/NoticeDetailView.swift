import DesignSystem
import SwiftUI

struct NoticeDetailView: View {
    @StateObject var viewModel: NoticeDetailViewModel

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 24) {
                    Text("공지 제목")
                        .dmsFont(.title(.small), color: .GrayScale.gray7)
                        .padding(.top, 40)

                    Divider()
                }
                HStack(alignment: .bottom) {
                    Text("""
동해 물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세 남산 위에 저 소나무, 철갑을 두른 듯바람 서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한 사람, 대한으로 길이 보전하세
""")
                    .padding(.top, 24)
                    .padding(.bottom, 40)

                    Text("22/01/21  8:29")
                        .dmsFont(.text(.extraSmall), color: .GrayScale.gray5)

                    Spacer()
                }
                Spacer()
            }
            .navigationTitle("공지")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal, 24)
            Spacer()
        }
        Spacer()
    }
}
