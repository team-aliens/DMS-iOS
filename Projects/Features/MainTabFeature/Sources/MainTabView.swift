import SwiftUI
import HomeFeature
import ApplyFeature
import NoticeFeature
import MyPageFeature
import BaseFeature
import DesignSystem
import Utility

enum TabFlow: Int {
    case home
    case apply
    case notice
    case myPage
}
struct MainTabView: View {
    @State var selection: TabFlow = .home
    @State var tabbarHidden = false

    private let homeComponent: HomeComponent
    private let studyRoomListComponent: StudyRoomListComponent
    private let noticeComponent: NoticeListComponent
    private let myPageComponent: MyPageComponent

    init(
        homeComponent: HomeComponent,
        studyRoomListComponent: StudyRoomListComponent,
        noticeComponent: NoticeListComponent,
        myPageComponent: MyPageComponent
    ) {
        self.homeComponent = homeComponent
        self.studyRoomListComponent = studyRoomListComponent
        self.noticeComponent = noticeComponent
        self.myPageComponent = myPageComponent
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                homeComponent.makeView()
                    .tag(TabFlow.home)

                studyRoomListComponent.makeView()
                    .tag(TabFlow.apply)

                noticeComponent.makeView()
                    .tag(TabFlow.notice)

                myPageComponent.makeView()
                    .tag(TabFlow.myPage)
            }
            .environment(\.tabbarHidden, $tabbarHidden)

            if !tabbarHidden {
                VStack {
                    Spacer()

                    tabbarView()
                        .background {
                            Color.GrayScale.gray1
                                .cornerRadius(24, corners: [.topLeft, .topRight])
                                .ignoresSafeArea()
                        }
                    .dmsShadow(style: .tabbar)
                }
            }
        }
        .onAppear {
            UITabBar.hideTabBar()
        }
    }

    @ViewBuilder
    func tabbarView() -> some View {
        let tabItem: [(String, String, TabFlow)] = [
            ("house", "홈", .home),
            ("plus.bubble", "신청", .apply),
            ("megaphone", "안내", .notice),
            ("person", "마이페이지", .myPage)
        ]

        HStack {
            Spacer()

            ForEach(tabItem, id: \.1) { name, title, tag in
                tabItemView(systemName: name, title: title, tag: tag)

                Spacer()
            }
        }
    }

    @ViewBuilder
    func tabItemView(systemName: String, title: String, tag: TabFlow) -> some View {
        Button {
            withAnimation {
                selection = tag
            }
        } label: {
            VStack(spacing: 7) {
                Image(systemName: systemName)
                    .foregroundColor(tag == selection ? .GrayScale.gray8 : .GrayScale.gray5)

                Text(title)
                    .dmsFont(.etc(.overline), color: tag == selection ? .GrayScale.gray8 : .GrayScale.gray5)
            }
            .padding(.top, 12)
            .padding(.bottom, 4)
        }

    }
}
