import SwiftUI

struct DMSSelectionTabbKey: EnvironmentKey {
    static var defaultValue: Binding<TabFlow> = .constant(.home)
}

public extension EnvironmentValues {
    var dmsSelectionTabbKey: Binding<TabFlow> {
        get { self[DMSSelectionTabbKey.self] }
        set { self[DMSSelectionTabbKey.self] = newValue }
    }
}
