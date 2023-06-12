import SwiftUI

public protocol SignupPasswordFactory {
    associatedtype SomeView: View
    func makeView(signupPasswordParam: SignupPasswordParam) -> SomeView
}
