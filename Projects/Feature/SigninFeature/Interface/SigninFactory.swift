import SwiftUI

public protocol SigninFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
