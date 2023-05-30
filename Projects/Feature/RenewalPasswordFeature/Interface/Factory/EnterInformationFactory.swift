import SwiftUI

public protocol EnterInformationFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
