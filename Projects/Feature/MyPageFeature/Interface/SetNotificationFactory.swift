import SwiftUI

public protocol SetNotificationFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
