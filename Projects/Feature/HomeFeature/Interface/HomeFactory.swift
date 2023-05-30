import SwiftUI

public protocol HomeFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
