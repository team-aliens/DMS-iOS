import SwiftUI

public extension Color {
    struct ErrorVariant { }
}

public extension Color.ErrorVariant {
    static let lighten1: Color = WatchDesignSystemAsset.ErrorColor.errorLighten1.swiftUIColor
    static let lighten2: Color = WatchDesignSystemAsset.ErrorColor.errorLighten2.swiftUIColor
    static let error: Color = WatchDesignSystemAsset.ErrorColor.error.swiftUIColor
    static let darken1: Color = WatchDesignSystemAsset.ErrorColor.errorDarken1.swiftUIColor
    static let darken2: Color = WatchDesignSystemAsset.ErrorColor.errorDarken2.swiftUIColor
}
