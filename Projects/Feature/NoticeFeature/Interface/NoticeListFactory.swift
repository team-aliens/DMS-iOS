import SwiftUI

public protocol NoticeListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
