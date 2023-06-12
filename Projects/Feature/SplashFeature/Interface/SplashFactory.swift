import SwiftUI

public protocol SplashFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
