import SwiftUI
import Swinject

@main
struct DMSWatchApp: App {
    let container = Container()
    let mainFactory: MainFactory
    let assembler: Assembler

    init() {
        assembler = Assembler([
            MealAssembly(),
            NoticeAssembly(),
            DetailNoticeAssembly(),
            MainAssembly(),
            AppAssembly()
        ], container: container)
        mainFactory = container.resolve(MainFactory.self)!
        _ = container.resolve(WatchSessionManager.self)
    }

    var body: some Scene {
        WindowGroup {
            mainFactory.makeView()
        }
    }
}
