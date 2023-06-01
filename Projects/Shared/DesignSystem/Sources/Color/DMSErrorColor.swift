import SwiftUI

public extension Color {
    struct ErrorVariant { }
}

public extension Color.ErrorVariant {
    static let lighten1: Color = DesignSystemAsset.ErrorColor.errorLighten1.suiColor
    static let lighten2: Color = DesignSystemAsset.ErrorColor.errorLighten2.suiColor
    static let error: Color = DesignSystemAsset.ErrorColor.error.suiColor
    static let darken1: Color = DesignSystemAsset.ErrorColor.errorDarken1.suiColor
    static let darken2: Color = DesignSystemAsset.ErrorColor.errorDarken2.suiColor
}
