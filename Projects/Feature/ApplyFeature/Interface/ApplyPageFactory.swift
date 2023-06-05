import SwiftUI

public protocol ApplyPageFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
