import SwiftUI

public protocol SignupPasswordFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
