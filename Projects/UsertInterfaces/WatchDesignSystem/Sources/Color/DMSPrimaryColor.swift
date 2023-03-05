import SwiftUI

public extension Color {
    struct PrimaryVariant { }
}

public extension Color.PrimaryVariant {
    static let lighten1: Color = WatchDesignSystemAsset.PrimaryColor.lighten1.swiftUIColor
    static let lighten2: Color = WatchDesignSystemAsset.PrimaryColor.lighten2.swiftUIColor
    static let primary: Color = WatchDesignSystemAsset.PrimaryColor.primary.swiftUIColor
    static let darken1: Color = WatchDesignSystemAsset.PrimaryColor.darken1.swiftUIColor
    static let darken2: Color = WatchDesignSystemAsset.PrimaryColor.darken2.swiftUIColor
}
