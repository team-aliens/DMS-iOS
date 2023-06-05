import SwiftUI

public protocol SchoolCodeFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
