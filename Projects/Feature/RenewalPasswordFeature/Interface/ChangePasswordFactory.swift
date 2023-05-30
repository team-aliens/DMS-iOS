import SwiftUI

public protocol ChangePasswordFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
