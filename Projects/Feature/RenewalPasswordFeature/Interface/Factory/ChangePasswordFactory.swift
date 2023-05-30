import SwiftUI

public protocol ChangePasswordFactory {
    associatedtype SomeView: View
    func makeView(changePasswordParm: ChangePasswordParm) -> SomeView
}
