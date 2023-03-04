import SwiftUI

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    private var intent: any MainIntentProtocol { container.intent }
    private var state: any MainStateProtocol { container.model }

    var body: some View {
        Text("ASDF")
    }
}
