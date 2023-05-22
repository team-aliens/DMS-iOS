import SwiftUI

public extension Color {
    struct PrimaryVariant { }
}

public extension Color.PrimaryVariant {
    static let lighten1: Color = DesignSystemAsset.PrimaryColor.lighten1.suiColor
    static let lighten2: Color = DesignSystemAsset.PrimaryColor.lighten2.suiColor
    static let primary: Color = DesignSystemAsset.PrimaryColor.primary.suiColor
    static let darken1: Color = DesignSystemAsset.PrimaryColor.darken1.suiColor
    static let darken2: Color = DesignSystemAsset.PrimaryColor.darken2.suiColor
}
