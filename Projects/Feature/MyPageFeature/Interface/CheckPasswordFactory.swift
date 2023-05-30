import SwiftUI

public protocol CheckPasswordFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
