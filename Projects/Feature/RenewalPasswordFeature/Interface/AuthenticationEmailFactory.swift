import SwiftUI

public protocol AuthenticationEmailFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
