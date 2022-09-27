import SwiftUI
import DesignSystem

@main
struct DMSApp: App {
    @State var test = ""
    @State var isError = false
    var body: some Scene {
        WindowGroup {
            DMSFloatingTextField("아이디", text: $test, helpMessage: "asd", isError: isError, errorMessage: "Error") {
                isError.toggle()
            }
            .padding()
        }
    }
}
