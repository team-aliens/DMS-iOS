import SwiftUI

public protocol SignupEmailVerifyFactory {
    associatedtype SomeView: View
    func makeView(signupEmailVerifyParam: SignupEmailVerifyParam) -> SomeView
}
