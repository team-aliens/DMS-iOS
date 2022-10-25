import SwiftUI
import DesignSystem
import HomeFeature

enum TabFlow: Int {
    case home
    case apply
    case notice
    case myPage
}
struct MainTabView: View {
    @State var selection: TabFlow = .home

    private let homeComponent: HomeComponent

    init(homeComponent: HomeComponent) {
        self.homeComponent = homeComponent
    }

    var body: some View {
        NavigationView {
            ZStack {
                Group {
                    switch selection {
                    case .home:
                        homeComponent.makeView()

                    case .apply:
                        Text("1")

                    case .notice:
                        Text("2")

                    case .myPage:
                        Text("3")
                    }
                }

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
                .padding(12)
        }

    }
}
