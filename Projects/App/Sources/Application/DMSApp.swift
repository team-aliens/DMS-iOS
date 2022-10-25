import SwiftUI
import DesignSystem

@main
struct DMSApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AppComponent().mainTabComponent.makeView()
            }
        }
    }
}
