import SwiftUI
import DesignSystem

@main
struct DMSApp: App {
    @State var test = ""
    @State var isError = false
    var body: some Scene {
        WindowGroup {
            DMSFormTextField("제목을 입력해주세요", text: $test)
            .padding()
        }
    }
}
