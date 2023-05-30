import SwiftUI

public protocol SignupEmailAuthCodeVerifyFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
