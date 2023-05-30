import SwiftUI

public protocol SignupTermsFactory {
    associatedtype SomeView: View
    func makeView(signupTermsParam: SignupTermsParam) -> SomeView
}
