import SwiftUI

public protocol ModifyPasswordFactory {
    associatedtype SomeView: View
    func makeView(currentPassword: String) -> SomeView
}
