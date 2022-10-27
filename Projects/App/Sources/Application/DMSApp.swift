import SwiftUI
import DesignSystem
import FindIDFeature
import SigninFeature
import SignupFeature

@main
struct DMSApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().signupProfileImageComponent.makeView(
                signupProfileImageParam: .init(
                    schoolCode: "",
                    schoolAnswer: "",
                    email: "",
                    grade: 1,
                    classRoom: 1,
                    number: 1,
                    accountID: "",
                    password: ""
                )
            )
        }
    }
}
