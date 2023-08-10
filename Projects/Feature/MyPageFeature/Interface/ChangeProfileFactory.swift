import SwiftUI

public protocol ChangeProfileFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
