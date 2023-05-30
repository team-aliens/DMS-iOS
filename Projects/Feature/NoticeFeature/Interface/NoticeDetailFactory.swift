import SwiftUI

public protocol NoticeDetailFactory {
    associatedtype SomeView: View
    func makeView(id: String) -> SomeView
}
