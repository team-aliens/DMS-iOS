import SwiftUI

struct TabbarHiddenKey: EnvironmentKey {
    static var defaultValue: Binding<Bool> = .constant(false)
}

public extension EnvironmentValues {
    var tabbarHidden: Binding<Bool> {
        get { self[TabbarHiddenKey.self] }
        set { self[TabbarHiddenKey.self] = newValue }
    }
}
