import SwiftUI

public protocol RemainApplyFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
