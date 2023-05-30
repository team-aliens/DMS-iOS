import SwiftUI

public protocol IDSettingFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
