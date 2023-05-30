import SwiftUI

public protocol SignupEmailVerifyFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
