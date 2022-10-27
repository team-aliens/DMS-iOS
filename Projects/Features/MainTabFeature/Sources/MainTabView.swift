import SwiftUI
import DesignSystem
import HomeFeature
import BaseFeature
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

    init(homeComponent: HomeComponent) {
        self.homeComponent = homeComponent
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                homeComponent.makeView()
                    .tag(TabFlow.home)

                Text("1")
                    .tag(TabFlow.apply)

                Text("2")
                    .tag(TabFlow.notice)

                Text("3")
                    .tag(TabFlow.myPage)
            }
            .environment(\.tabbarHidden, $tabbarHidden)

            if !tabbarHidden {
                VStack {
                    Spacer()

                    tabbarView()
                        .background {
                            Color.GrayScale.gray1
                                .ignoresSafeArea()
                        }
                        .shadow(
                            color: .GrayScale.gray5.opacity(0.24),
                            radius: 20,
                            y: 1
                        )
                }
            }
        }
        .onAppear {
            UITabBar.hideTabBar()
        }
    }

    @ViewBuilder
    func tabbarView() -> some View {
        let tabItem: [(String, TabFlow)] = [
            ("house", .home),
            ("plus.bubble", .apply),
            ("megaphone", .notice),
            ("person", .myPage)
        ]

        HStack {
            Spacer()

            ForEach(tabItem, id: \.1) { name, tag in
                tabItemView(systemName: name, tag: tag)

                Spacer()
            }
        }
    }

    @ViewBuilder
    func tabItemView(systemName: String, tag: TabFlow) -> some View {
        Button {
            withAnimation {
                selection = tag
            }
        } label: {
            Image(systemName: systemName)
                .foregroundColor(tag == selection ? .GrayScale.gray8: .GrayScale.gray5)
                .overlay(alignment: .top) {
                    Circle()
                        .fill(Color.PrimaryVariant.darken2)
                        .frame(width: tag == selection ? 4 : 0, height: tag == selection ? 4 : 0)
                        .offset(y: -8)
                }
                .padding(16)
        }

    }
}
