import SwiftUI

public protocol IDSettingFactory {
    associatedtype SomeView: View
    func makeView(idSettingParam: IDSettingParam) -> SomeView
}
