import SwiftUI

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    private let mealFactory: MealFactory
    private var intent: any MainIntentProtocol { container.intent }
    private var state: any MainStateProtocol { container.model }

    init(
        container: MVIContainer<MainIntentProtocol, MainStateProtocol>,
        mealFactory: MealFactory
    ) {
        _container = StateObject(wrappedValue: container)
        self.mealFactory = mealFactory
    }

    var body: some View {
        NavigationView {
            TabView(selection: Binding(
                get: { state.currentTab },
                set: { intent.tabChanged(tab: $0) }
            )) {
                mealFactory.makeView()
                    .tag(MainTab.meal)

                Text("Notice")
                    .tag(MainTab.notice)
            }
            .tabViewStyle(.page)
            .navigationTitle("DMS")
        }
        .navigationViewStyle(.stack)
    }
}
