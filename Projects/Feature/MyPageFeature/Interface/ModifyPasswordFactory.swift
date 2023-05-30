import SwiftUI

public protocol ModifyPasswordFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
