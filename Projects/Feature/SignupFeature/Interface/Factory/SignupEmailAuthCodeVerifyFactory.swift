import SwiftUI

public protocol SignupEmailAuthCodeVerifyFactory {
    associatedtype SomeView: View
    func makeView(signupEmailAuthCodeVerifyParam: SignupEmailAuthCodeVerifyParam) -> SomeView
}
