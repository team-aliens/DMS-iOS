import SwiftUI
import Swinject

@main
struct DMSWatchApp: App {
    let mainFactory = MainFactory()

    var body: some Scene {
        WindowGroup {
            mainFactory.makeView()
        }
    }
}
