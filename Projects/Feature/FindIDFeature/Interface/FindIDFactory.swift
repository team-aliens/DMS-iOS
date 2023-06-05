import SwiftUI

public protocol FindIDFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
