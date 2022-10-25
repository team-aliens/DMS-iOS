import SwiftUI
import DesignSystem

struct MainTabView: View {
    @State var selection = 0
    @Namespace var animation

    var body: some View {
        VStack {
            TabView(selection: $selection) {
                Text("0")
                    .tag(0)

                Text("1")
                    .tag(1)

                Text("2")
                    .tag(2)

                Text("3")
                    .tag(3)
            }
            .ignoresSafeArea()

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

    @ViewBuilder
    func tabbarView() -> some View {
        let tabItem: [(String, Int)] = [
            ("house", 0),
            ("plus.bubble", 1),
            ("megaphone", 2),
            ("person", 3)
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
    func tabItemView(systemName: String, tag: Int) -> some View {
        Button {
            withAnimation {
                selection = tag
            }
        } label: {
            Image(systemName: systemName)
                .foregroundColor(tag == selection ? .GrayScale.gray8 : .GrayScale.gray5)
                .overlay(alignment: .top) {
                    if tag == selection {
                        Circle()
                            .fill(Color.PrimaryVariant.darken2)
                            .frame(width: 4, height: 4)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .offset(y: -8)
                    } else {
                        EmptyView()
                    }
                }
                .padding(12)
        }

    }
}
