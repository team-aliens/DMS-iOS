import SwiftUI

public protocol OutingApplyFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
