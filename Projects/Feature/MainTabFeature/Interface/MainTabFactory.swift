import SwiftUI

public protocol MainTabFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
