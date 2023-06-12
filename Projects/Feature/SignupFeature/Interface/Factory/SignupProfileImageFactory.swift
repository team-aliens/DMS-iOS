import SwiftUI

public protocol SignupProfileImageFactory {
    associatedtype SomeView: View
    func makeView(signupProfileImageParam: SignupProfileImageParam) -> SomeView
}
