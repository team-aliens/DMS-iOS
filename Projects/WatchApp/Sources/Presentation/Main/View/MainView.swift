import SwiftUI

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    private let mealFactory: MealFactory
    private let noticeFactory: NoticeFactory
    private var intent: any MainIntentProtocol { container.intent }
    private var state: any MainStateProtocol { container.model }

    init(
        container: MVIContainer<MainIntentProtocol, MainStateProtocol>,
        mealFactory: MealFactory,
        noticeFactory: NoticeFactory
    ) {
        _container = StateObject(wrappedValue: container)
        self.mealFactory = mealFactory
        self.noticeFactory = noticeFactory
    }

    var body: some View {
        NavigationView {
            TabView(selection: Binding(
                get: { state.currentTab },
                set: { intent.tabChanged(tab: $0) }
            )) {
                mealFactory.makeView()
                    .tag(MainTab.meal)

                noticeFactory.makeView()
                    .tag(MainTab.notice)
            }
            .tabViewStyle(.page)
            .navigationTitle("DMS")
        }
        .navigationViewStyle(.stack)
    }
}
