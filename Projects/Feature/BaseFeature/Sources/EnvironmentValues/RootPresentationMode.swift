import SwiftUI

public struct RootPresentationModeKey: EnvironmentKey {
    public static let defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

public extension EnvironmentValues {
    var rootPresentationMode: Binding<RootPresentationMode> {
        get { return self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

public typealias RootPresentationMode = Bool

public extension RootPresentationMode {
    mutating func dismiss() {
        self.toggle()
    }
}
