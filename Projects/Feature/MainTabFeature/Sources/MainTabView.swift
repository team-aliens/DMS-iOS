import SwiftUI
import HomeFeature
import ApplyFeature
import NoticeFeature
import MyPageFeature
import BaseFeature
import DesignSystem
import Utility

// swiftlint: disable large_tuple
struct MainTabView: View {
    @State var selection: TabFlow = .home
    @State var tabbarHidden = false

    @EnvironmentObject var appState: AppState

    var tabItem: [(String, String, TabFlow)] {
        var tabItems: [(String, String, TabFlow)] = [
            ("house", "홈", .home),
            ("megaphone", "안내", .notice),
            ("person", "마이페이지", .myPage)
        ]
        if appState.features.studyRoomService || appState.features.remainService {
            tabItems.insert(("plus.bubble", "신청", .apply), at: 1)
        }
        return tabItems
    }

    private let homeComponent: HomeComponent
    private let applyPageComponent: ApplyPageComponent
    private let noticeComponent: NoticeListComponent
    private let myPageComponent: MyPageComponent

    init(
        homeComponent: HomeComponent,
        applyPageComponent: ApplyPageComponent,
        noticeComponent: NoticeListComponent,
        myPageComponent: MyPageComponent
    ) {
        self.homeComponent = homeComponent
        self.applyPageComponent = applyPageComponent
        self.noticeComponent = noticeComponent
        self.myPageComponent = myPageComponent
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                homeComponent.makeView()
                    .tag(TabFlow.home)

                if appState.features.studyRoomService || appState.features.remainService {
                    applyPageComponent.makeView()
                        .tag(TabFlow.apply)
                }

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
                        .environment(\.dmsSelectionTabbKey, $selection)
                }
            }
        }
        .onChange(of: tabbarHidden) { _ in
            UITabBar.hideTabBar()
        }
        .environment(\.dmsSelectionTabbKey, $selection)
        .onOpenURL { url in
            self.selection = url.absoluteString.toTabFlow()
        }
    }

    @ViewBuilder
    func tabbarView() -> some View {
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
